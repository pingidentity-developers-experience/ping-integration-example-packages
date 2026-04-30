##########################################################################
# pingone_davinci_flow_enable.tf
# Declarations to enable PingOne DaVinci Flow.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_flow_enable}
# {@link https://docs.pingidentity.com/davinci/flows/davinci_flows.html}
##########################################################################

resource "pingone_davinci_flow_enable" "pingone_davinci_registration_example" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.pingone_davinci_registration_example.id
  enabled        = true
}