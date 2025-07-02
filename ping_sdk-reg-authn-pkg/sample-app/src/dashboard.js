import { 
  Config, 
  UserManager,
  FRUser, 
  TokenManager
} from '@forgerock/javascript-sdk';

document.addEventListener('DOMContentLoaded', async () => {
  /**
   * Check URL for query parameters
   */
  const url = new URL(document.location);
  const params = url.searchParams;
  const authCode = params.get("code");
  const state = params.get("state");

  /**
   * If the URL parameters contain state and authCode 
   * then get the tokens and user info otherwise
   * redirect to the index page
   */
  if (state && authCode) {
      await authorize(authCode, state);
  } else {
      window.location.assign("/index.html");
  }
});

const authorize = async (code, state) => {
    await Config.setAsync({
        clientId: window._env_.clientId,
        redirectUri: "https://localhost:8080/dashboard.html",
        scope: "openid profile email revoke",
        serverConfig: {
          wellknown: `https://auth.pingone.${window._env_.pingOneDomain}/${window._env_.pingOneEnvId}/as/.well-known/openid-configuration`,
          timeout: Number(4000),
        },
    });

    const tokens = await TokenManager.getTokens({
        query: { code, state },
    });

    const user = await UserManager.getCurrentUser();
    updateUI(tokens, user);
};

document.addEventListener("DOMContentLoaded", () => {
  const logoutButton = document.getElementById("logout");

  if (logoutButton) {
    logoutButton.addEventListener("click", logout);
  }
});

const logout = async () => {
  try {
    await FRUser.logout({
      logoutRedirectUri: "https://localhost:8080",
    });
  } catch (error) {
    console.error(error);
  }
};

// Update the DOM with tokens and user info data
function updateUI(tokens, userInfo) {
    document.getElementById("access-token").innerHTML = tokens.accessToken;
    document.getElementById("id-token").innerHTML = tokens.idToken;
    document.getElementById("user-info").innerHTML =
        "<pre>" + JSON.stringify(userInfo, undefined, 2) + "</pre>";
}