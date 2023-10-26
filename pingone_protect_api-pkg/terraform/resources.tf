##########################################################################
# resource.tf - Declarations for PingOne resources.
# {@link https://developer.hashicorp.com/terraform/language/resources}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_resources}
##########################################################################

##############################################
# PingOne Populations
##############################################

# PingOne Population
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/population}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_populations}
resource "pingone_population" "pop_api" {
  environment_id = module.environment.environment_id
  name           = "Protect API Sample Users"
  description    = "Protect SDK Sample Population"
}

resource "pingone_application" "worker_app" {
  environment_id = module.environment.environment_id
  name           = "DemoWorkerApp"
  enabled        = true

  oidc_options {
    type                        = "WORKER"
    grant_types                 = ["CLIENT_CREDENTIALS"]
    token_endpoint_authn_method = "CLIENT_SECRET_BASIC"
  }
}

# PingOne Role Assignment
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_role_assignment}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_t_configurerolesforworkerapplication}

resource "pingone_application_role_assignment" "population_identity_data_admin_to_application" {
  environment_id = module.environment.environment_id
  application_id = pingone_application.worker_app.id
  role_id        = data.pingone_role.identity_data_admin.id

  scope_population_id = pingone_population.pop_api.id
}

##############################################
# PingOne Custom Resources
##############################################

resource "pingone_resource" "protect_api" {
  environment_id                = module.environment.environment_id
  name                          = "Protect API"
  description                   = "Custom resources for the Protect API sample app"
  audience                      = "protect-api"
  access_token_validity_seconds = 3600
}

###############################################################
# Output PingOne Environment variables to local .env file
###############################################################

resource "local_file" "env" {
  content  = "P1_DOMAIN=\"${local.pingone_domain}\"\nP1_ENV_ID=\"${module.environment.environment_id}\"\nP1_WORKER_CLIENT_ID=\"${pingone_application.worker_app.oidc_options[0].client_id}\"\nP1_WORKER_CLIENT_SECRET=\"${pingone_application.worker_app.oidc_options[0].client_secret}\""
  filename = "../sample-app/.env"
}