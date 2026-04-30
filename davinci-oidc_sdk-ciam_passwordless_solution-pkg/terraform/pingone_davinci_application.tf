##########################################################################
# pingone_davinci_application.tf
# Declarations for PingOne DaVinci Application.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_application}
# {@link https://docs.pingidentity.com/davinci/applications/davinci_applications.html}
##########################################################################

resource "pingone_davinci_application" "passwordless_main_flow_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "DaVinci OIDC Passwordless Sample Application"

  api_key = {
    enabled = true
  }
}