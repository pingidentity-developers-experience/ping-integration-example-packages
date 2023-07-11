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

fastify.post('/getRiskDecision', async (req, res) => {
  let workerToken;

  try {
    workerToken = await getWorkerToken();
  } catch (err) {
    res.code(500).send('An error occurred getting a worker token from PingOne application')
    return;
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
          id: req.body.username, // if P1, send in the UserId and set `type` to PING_ONE
          name: req.body.username, // This is displayed in Dashboard and Audit
          type: 'EXTERNAL'
        },
        sharingType: 'PRIVATE', 
        origin: 'P1_PROTECT_DEMO' 
      }
    }),
  });

  const riskJson = await riskResponse.json();
  res.code(200).send(riskJson);
});

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