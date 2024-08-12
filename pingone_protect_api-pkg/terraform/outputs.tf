##########################################################################
# outputs.tf - (optional) Contains outputs from the resources created
# @see https://developer.hashicorp.com/terraform/language/values/outputs
##########################################################################

output "pingone_envid" {
  value = pingone_environment.my_environment.id
}

output "worker_app_client_id" {
  value = pingone_application.worker_app.oidc_options.client_id
}

output "worker_app_client_secret" {
  value     = pingone_application_secret.worker_app.secret
  sensitive = true
}

output "pingone_domain" {
  value = local.pingone_domain
}
