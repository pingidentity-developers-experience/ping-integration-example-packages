##########################################################################
# pingone_davinci_application.tf
# Declarations for PingOne DaVinci Application.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_application}
# {@link https://docs.pingidentity.com/davinci/applications/davinci_applications.html}
##########################################################################

resource "pingone_davinci_application" "registration_flow_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "DaVinci API Registration Sample Application"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types   = ["authorizationCode"]
    redirect_uris = ["https://auth.pingone.com/da1a5e8f-a678-4182-abb0-e08d05b873cb/rp/callback/openid_connect"]
    scopes        = ["openid", "profile"]
  }
}