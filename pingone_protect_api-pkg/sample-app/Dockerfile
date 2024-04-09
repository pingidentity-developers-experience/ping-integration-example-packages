FROM node:lts-alpine

LABEL version="0.0.1"
LABEL description="Pingone Protect Integration Package Example App"
LABEL maintainer="Ping Identity Technical Enablement"

# update packages, to reduce risk of vulnerabilities
RUN apk update && apk upgrade
RUN apk add --no-cache dumb-init bash

# set a non privileged user to use when running this image
USER node

# set right (secure) folder permissions
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

# set default node env
ARG NODE_ENV=production

# to be able to run tests (for example in CI), do not set production as environment
ENV NODE_ENV=${NODE_ENV}

ENV NPM_CONFIG_LOGLEVEL=warn

# copy project definition/dependencies files, for better reuse of layers
COPY --chown=node:node package*.json ./

# Install only production packages without updating dependencies. Ignore 3rd-party scripts
RUN npm config set update-notifier false && npm ci --only-production --ignore-scripts && npm audit fix --force && npm cache clean --force

# copy all sources in the container (exclusions in .dockerignore file)
COPY --chown=node:node . .

# Make sure our shell script is executable
COPY --chmod=111 ./env.sh .

# exposed port/s
EXPOSE 4001

# Runs dumb-init to manage CMD commands
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Start the container
CMD ["/bin/bash", "-c", "/home/node/app/env.sh .env.template && node server.js"]
