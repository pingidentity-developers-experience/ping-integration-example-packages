##########################################################################
# pingone_davinci_flow_deploy.tf
# Declarations for PingOne DaVinci Flow Deployment.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_flow_deploy}
# {@link https://docs.pingidentity.com/davinci/flows/davinci_flows.html}
##########################################################################

resource "pingone_davinci_flow_deploy" "pingone_davinci_api_registration_example" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.pingone_davinci_api_registration_example.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.pingone_davinci_api_registration_example.current_version
  }
}