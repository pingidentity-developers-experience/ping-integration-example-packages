##########################################################################
# outputs.tf - (optional) Contains outputs from the resources created
# @see https://developer.hashicorp.com/terraform/language/values/outputs
##########################################################################

output "pingone_envid" {
  value = pingone_environment.my_environment.id
}

output "oidc_app_client_id" {
  value = pingone_application.oidc_sdk_sample_app.id
}