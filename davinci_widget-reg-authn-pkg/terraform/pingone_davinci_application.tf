##########################################################################
# pingone_davinci_application.tf
# Declarations for PingOne DaVinci Application.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_application}
# {@link https://docs.pingidentity.com/davinci/applications/davinci_applications.html}
##########################################################################

resource "pingone_davinci_application" "registration_flow_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "DaVinci Registration Sample Application"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types   = ["authorizationCode"]
    redirect_uris = ["https://auth.pingone.com/ad727b2b-3a61-43fd-94e8-2686db4b3d55/rp/callback/openid_connect"]
    scopes        = ["openid", "profile"]
  }
}