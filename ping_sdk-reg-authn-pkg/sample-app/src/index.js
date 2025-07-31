import {
  Config,
  TokenManager,
} from '@forgerock/javascript-sdk';

document.addEventListener('DOMContentLoaded', async () => {
  // Step 1: Configure the SDK
  await Config.setAsync({
    clientId: window._env_.clientId,
    redirectUri: "https://localhost:8080/dashboard.html",
    scope: "openid profile email revoke",
    serverConfig: {
      wellknown: `https://auth.pingone.${window._env_.pingOneDomain}/${window._env_.pingOneEnvId}/as/.well-known/openid-configuration`,
      timeout: Number(4000),
    },
  });
});

const loginBtn = document.getElementById('loginBtn');
loginBtn.addEventListener('click', async () => {
    console.log('Redirecting to login...');
    await TokenManager.getTokens({
        forceRenew: false,
        login: "redirect",
        skipBackgroundRequest: true
    });
});
