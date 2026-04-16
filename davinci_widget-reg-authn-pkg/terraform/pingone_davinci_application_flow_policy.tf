##########################################################################
# pingone_davinci_application_flow_policy.tf
# Declarations for PingOne DaVinci Application Flow Policy resources.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_application_flow_policy}
# {@link https://docs.pingidentity.com/davinci/applications/davinci_flow_policies.html}
##########################################################################

resource "pingone_davinci_application_flow_policy" "registration_flow_app_policy" {
  environment_id         = pingone_environment.my_environment.id
  davinci_application_id = pingone_davinci_application.registration_flow_app.id
  name                   = "DaVinci Registration Sample Policy"
  status                 = "enabled"

  flow_distributions = [
    {
      id      = pingone_davinci_flow.pingone_davinci_registration_example.id
      version = -1
      weight  = 100
    }
  ]
}