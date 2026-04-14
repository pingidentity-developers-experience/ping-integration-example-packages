
resource "pingone_davinci_application_flow_policy" "registration_flow_app_policy" {
  environment_id         = pingone_environment.my_environment.id
  davinci_application_id = pingone_davinci_application.registration_flow_app.id
  name                   = "DaVinci API Protect Sample Policy"
  status                 = "enabled"

  flow_distributions = [
    {
      id      = pingone_davinci_flow.pingone_davinci_api_protect_example.id
      version = -1
      weight  = 100
    }
  ]
}