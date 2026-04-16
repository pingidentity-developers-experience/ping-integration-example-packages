##########################################################################
# resources.tf - Declarations for PingOne resources.
# {@link https://developer.hashicorp.com/terraform/language/resources}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_resources}
##########################################################################

##########################################################################
# PingOne Default Population
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/population_default}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_populations}
##########################################################################
resource "pingone_population_default" "default_population" {
  environment_id = pingone_environment.my_environment.id
  name           = "Default Population"
}

##########################################################################
# PingOne Connection (application)
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_app_worker}
##########################################################################

resource "pingone_application" "worker_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "Worker App"
  enabled        = true

  oidc_options = {
    type                        = "WORKER"
    grant_types                 = ["CLIENT_CREDENTIALS"]
    token_endpoint_auth_method = "CLIENT_SECRET_BASIC"
  }
}

##########################################################################
# PingOne Worker Application Secret
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_secret}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_app_worker}
##########################################################################

resource "pingone_application_secret" "worker_app_secret" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.worker_app.id
}

// Assign the "Identity Data Admin" role to the worker application
resource "pingone_application_role_assignment" "population_identity_data_admin_to_application" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.worker_app.id
  role_id        = data.pingone_role.identity_data_admin.id

  scope_environment_id = pingone_environment.my_environment.id
}

// Assign the "Environment Admin" role to the worker application
resource "pingone_application_role_assignment" "population_environment_admin_to_application" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.worker_app.id
  role_id        = data.pingone_role.environment_admin.id

  scope_environment_id = pingone_environment.my_environment.id
}


##########################################################################
# Output PingOne Environment variables to local global.js file
##########################################################################

resource "local_file" "env_config" {
  content  = "window._env_ = {\n  pingOneDomain: \"${module.pingone_utils.pingone_domain_suffix}\", \n companyId: \"${pingone_davinci_application.registration_flow_app.environment_id}\", \n apiKey: \"${pingone_davinci_application.registration_flow_app.api_key.value}\",\n  policyId: \"${pingone_davinci_application_flow_policy.registration_flow_app_policy.id}\"\n};"
  filename = "../sample-app/global.js"
}