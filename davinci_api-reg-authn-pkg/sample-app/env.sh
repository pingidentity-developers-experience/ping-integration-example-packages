#!/bin/bash

# Creates a JS file with a JSON object made up of environment variables that
# are set to the global window object.

# Recreate global.js file
rm -rf ./public/global.js

# creat global.js file from env vars
cat <<EOT >> ./public/global.js
window._env_ = {
  companyId: '${P1_ENV_ID}',
  pingOneDomain: '${P1_DOMAIN}',
  apiKey: '${DV_API_KEY}',
  policyId: '${DV_POLICY_ID}'
};
EOT

# This script will self destruct
# If you are running this locally, comment this out
rm -- "$0"
