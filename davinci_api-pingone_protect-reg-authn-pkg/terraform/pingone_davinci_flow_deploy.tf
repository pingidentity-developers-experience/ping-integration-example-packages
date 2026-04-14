
resource "pingone_davinci_flow_deploy" "pingone_davinci_api_protect_example" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.pingone_davinci_api_protect_example.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.pingone_davinci_api_protect_example.current_version
  }
}