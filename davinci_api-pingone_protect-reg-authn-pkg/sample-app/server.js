import Fastify from 'fastify';
import { fileURLToPath } from 'url';
import * as fs from 'fs';
import path from 'path';

// Initialize variables that are no longer available by default in Modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const fastify = Fastify({
  logger: false,
  ignoreTrailingSlash: true,
  trustProxy: true,
  http2: true,
  https: {
   allowHTTP1: true,
   key: fs.readFileSync(path.join(__dirname, 'certs', 'key.pem')),
   cert: fs.readFileSync(path.join(__dirname, 'certs', 'cert.pem')),
  }
});

// Initialize static html, css, etc from public folder
fastify.register(import('@fastify/static'), {
  root: path.join(__dirname, 'public'),
  prefix: '/',
});

fastify.listen({port: 8080, host: '0.0.0.0'},
  (err, address) => {
    if (err) {
      console.error(err);
      process.exit(1);
    }

    console.log(`Your app is listening on ${address}`);
  }
);