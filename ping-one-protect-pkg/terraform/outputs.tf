##########################################################################
# outputs.tf - (optional) Contains outputs from the resources created
# @see https://developer.hashicorp.com/terraform/language/values/outputs
##########################################################################

output "pingone_envid" {
  value = module.environment.environment_id
}

output "pop_api_app_client_id" {
  value = pingone_application.pop_api_sample_app.id
}