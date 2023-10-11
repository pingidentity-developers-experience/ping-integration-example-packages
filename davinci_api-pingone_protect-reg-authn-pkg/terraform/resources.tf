##########################################################################
# resources.tf - Declarations for PingOne resources.
# {@link https://developer.hashicorp.com/terraform/language/resources}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_resources}
##########################################################################

// Assign the "Identity Data Admin" role to the DV admin user
resource "pingone_role_assignment_user" "admin_sso_identity_admin" {
  environment_id       = var.admin_env_id
  user_id              = data.pingone_user.dv_admin_user.id
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = module.environment.environment_id
}

// Assign the "Environment Admin" role to the DV admin user
resource "pingone_role_assignment_user" "admin_sso_environment_admin" {
  environment_id       = var.admin_env_id
  user_id              = data.pingone_user.dv_admin_user.id
  role_id              = data.pingone_role.environment_admin.id
  scope_environment_id = module.environment.environment_id
}

// Assign the "Identity Data Admin" role to the DV admin user
resource "pingone_application_role_assignment" "population_identity_data_admin_to_application" {
  environment_id = module.environment.environment_id
  application_id = pingone_application.worker_app.id
  role_id        = data.pingone_role.identity_data_admin.id

  scope_environment_id = module.environment.environment_id
}

// Assign the "Environment Admin" role to the DV admin user
resource "pingone_application_role_assignment" "population_environment_admin_to_application" {
  environment_id = module.environment.environment_id
  application_id = pingone_application.worker_app.id
  role_id        = data.pingone_role.environment_admin.id

  scope_environment_id = module.environment.environment_id
}

##########################################################################
# PingOne Connection (application)
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_app_worker}
##########################################################################

resource "pingone_application" "worker_app" {
  environment_id = module.environment.environment_id
  name           = "Worker App"
  enabled        = true

  oidc_options {
    type                        = "WORKER"
    grant_types                 = ["CLIENT_CREDENTIALS"]
    token_endpoint_authn_method = "CLIENT_SECRET_BASIC"
  }
}

resource "davinci_connection" "pingone_protect" {
  connector_id   = "pingOneRiskConnector"
  environment_id = module.environment.environment_id
  name           = "PingOne Protect"

  property {
    name  = "envId"
    value = module.environment.environment_id
  }
  property {
    name  = "clientId"
    value = pingone_application.worker_app.id
  }
  property {
    name  = "clientSecret"
    value = pingone_application.worker_app.oidc_options[0].client_secret
  }
}

##########################################################################
# Output PingOne Environment variables to local global.js file
##########################################################################

resource "local_file" "env_config" {
  content  = "window._env_ = {\n  pingOneDomain: \"${local.pingone_domain}\",\n  pingOneEnvId: \"${module.environment.environment_id}\", \n  companyId: \"${davinci_application.registration_flow_app.environment_id}\",\n  apiKey: \"${davinci_application.registration_flow_app.api_keys.prod}\",\n  policyId: \"${element([for s in davinci_application.registration_flow_app.policy : s.policy_id if s.status == "enabled"], 0)}\"\n};"
  filename = "../sample-app/global.js"
}