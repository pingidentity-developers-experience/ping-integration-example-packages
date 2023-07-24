import Fastify from 'fastify';
import { fileURLToPath } from 'url';
import * as fs from 'fs';
import path from 'path';
import btoa from 'btoa'

import * as dotenv from 'dotenv';
dotenv.config();

// Initialize variables that are no longer available by default in Modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const fastify = Fastify({
  logger: false,
  ignoreTrailingSlash: true,
  trustProxy: true,
  http2: true,
  https: {
    key: fs.readFileSync(path.join(__dirname, 'certs', 'key.pem')),
    cert: fs.readFileSync(path.join(__dirname, 'certs', 'cert.pem')),
  }
});

// Initialize static html, css, etc from public folder
fastify.register(import('@fastify/static'), {
  root: path.join(__dirname, 'public'),
  prefix: '/',
});

fastify.post('/getRiskEvaluation', async (req, res) => {
  let username = req.body.username;

  if (!username) {
    res.code(400).send('username is required');
    return;
  }
  
  let workerToken;

  try {
    workerToken = await getWorkerToken();
  } catch (err) {
    res.code(500).send('An error occurred getting a worker token from PingOne application')
    return;
  }

  // Search P1 for username and get User ID back in case users want to demo P1 and External users
  const userId = await searchPingOneForUser(username, workerToken);
  let userType = 'EXTERNAL';

  if (userId) {
    userType = 'PING_ONE';
  }

  const riskResponse = await fetch(`https://api.pingone.com/v1/environments/${process.env.P1_ENV_ID}/riskEvaluations`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${workerToken}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      event: {
        targetResource: { 
            id: 'PingOne Protect SDK demo',
            name: 'PingOne Protect SDK demo'
        },
        ip: req.body.ipAddress,
        userAgent: req.headers['user-agent'],
        sdk: {
          signals: {
              data: req.body.rawRiskData // Signals SDK payload from Client
          }
      },
        flow: { 
            type: 'AUTHENTICATION' 
        },
        user: {
          id: userId || username, // if P1, send in the UserId and set `type` to PING_ONE
          name: username, // This is displayed in Dashboard and Audit
          type: userType
        },
        sharingType: 'PRIVATE', 
        origin: 'P1_PROTECT_DEMO' 
      }
    }),
  });

  if (riskResponse.status !== 201) {
    res.code(500).send('Unexpected error occurred while creating a risk evaluation');
    return;
  }

  const riskJson = await riskResponse.json();

  // Note: Add any custom validation against the risk evaluation before you update it and mark it as a 'SUCCESS'

  const updateResponse = await fetch(`https://api.pingone.com/v1/environments/${process.env.P1_ENV_ID}/riskEvaluations/${riskJson.id}/event`, {
    method: 'PUT',
    headers: {
      Authorization: `Bearer ${workerToken}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      completionStatus: 'SUCCESS'
    })
  });

  if (updateResponse.status !== 200) {
    res.code(500).send('Unexpected error occurred while updating risk evaluation');
    return;
  }

  res.code(200).send(riskJson);
});

async function searchPingOneForUser(username, token) {
  if (!token) {
    token = await getWorkerToken();
  }

  const response = await fetch(encodeURI(`https://api.pingone.com/v1/environments/${process.env.P1_ENV_ID}/users?filter=username eq \"${username}\"`), {
    headers: {
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json',
    }
  });

  const json = await response.json();
  return json._embedded?.users?.[0]?.id
}

async function getWorkerToken() {
  const basicAuth = btoa(`${process.env.P1_WORKER_CLIENT_ID}:${process.env.P1_WORKER_CLIENT_SECRET}`);
  const encodedBody = new URLSearchParams();
  encodedBody.append('grant_type', 'client_credentials');

  const tokenResponse = await fetch(`https://auth.pingone.com/${process.env.P1_ENV_ID}/as/token`, {
    headers: {
      Authorization: `Basic ${basicAuth}`,
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    method: 'POST',
    body: encodedBody,
  });

  const tokenJson = await tokenResponse.json();

  return tokenJson.access_token;
}

fastify.listen({port: 8080, host: '0.0.0.0'},
  (err, address) => {
    if (err) {
      console.error(err);
      process.exit(1);
    }

    console.log(`Your app is listening on ${address}`);
  }
);