##########################################################################
# outputs.tf - (optional) Contains outputs from the resources created
# @see https://developer.hashicorp.com/terraform/language/values/outputs
##########################################################################

output "pingone_envid" {
  value = pingone_environment.my_environment.id
}

output "pingone_domain" {
  value = module.pingone_utils.pingone_domain_suffix
}

output "dv_api_key" {
  value = pingone_davinci_application.registration_flow_app.api_key.value

  sensitive = true
}

output "dv_policy_id" {
  value = pingone_davinci_application_flow_policy.registration_flow_app_policy.id
}
