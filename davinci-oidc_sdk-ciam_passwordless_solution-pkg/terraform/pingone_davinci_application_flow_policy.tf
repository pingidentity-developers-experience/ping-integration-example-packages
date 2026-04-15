
resource "pingone_davinci_application_flow_policy" "registration_flow_policy" {
  environment_id         = pingone_environment.my_environment.id
  davinci_application_id = pingone_davinci_application.passwordless_main_flow_app.id
  name                   = "DaVinci OIDC Passwordless Sample Policy"
  status                 = "enabled"

  trigger = {
    type = "AUTHENTICATION"
  }

  flow_distributions = [
    {
      id      = pingone_davinci_flow.ciam_passwordless_protect_registration_authentication_account_recovery_main_flow.id
      version = -1
      weight  = 100
    }
  ]
}