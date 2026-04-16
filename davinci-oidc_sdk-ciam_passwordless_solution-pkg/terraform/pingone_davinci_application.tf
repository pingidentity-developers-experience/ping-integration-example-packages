
resource "pingone_davinci_application" "passwordless_main_flow_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "DaVinci OIDC Passwordless Sample Application"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types   = ["authorizationCode"]
    redirect_uris = ["https://auth.pingone.com/ceda943f-cedf-4a5f-a17f-f9b0770c0183/rp/callback/openid_connect"]
    scopes        = ["openid", "profile"]
  }
}