
resource "pingone_davinci_flow_enable" "pingone_davinci_api_protect_example" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.pingone_davinci_api_protect_example.id
  enabled        = true
}