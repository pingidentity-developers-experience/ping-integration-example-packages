
resource "pingone_davinci_application" "registration_flow_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "DaVinci API Protect Sample Application"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types   = ["authorizationCode"]
    redirect_uris = ["https://auth.pingone.com/dfe2c7c9-63f1-4c95-900b-689841a5bcf4/rp/callback/openid_connect"]
    scopes        = ["openid", "profile"]
  }
}