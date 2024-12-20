##########################################################################
# resources.tf - Declarations for PingOne resources.
# {@link https://developer.hashicorp.com/terraform/language/resources}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_resources}
##########################################################################

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

// Add new environment to DaVinci Admin group
resource "pingone_group_role_assignment" "single_environment_admin_to_group" {
  count          = var.assign_dv_admin_role ? 1 : 0
  environment_id = var.pingone_environment_id
  group_id       = data.pingone_group.davinci_admin.id
  role_id        = data.pingone_role.davinci_admin.id

  scope_environment_id = pingone_environment.my_environment.id
}

##############################################
# PingOne Populations
##############################################

# PingOne Population
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/population}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_populations}
resource "pingone_population_default" "oidc_sdk_pop" {
  environment_id = pingone_environment.my_environment.id
  name           = "Sample Users"
  description    = "Sample Population"
}

##########################################################################
# PingOne Connection (application)
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_app_worker}
##########################################################################

resource "pingone_application" "oidc_sdk_sample_app" {
  environment_id = pingone_environment.my_environment.id
  enabled        = true
  name           = "Sample App"
  description    = "A custom sample OIDC application to demonstrate PingOne integration."

  oidc_options = {
    type                        = "SINGLE_PAGE_APP"
    grant_types                 = ["AUTHORIZATION_CODE", "IMPLICIT", "REFRESH_TOKEN"]
    response_types              = ["CODE", "TOKEN", "ID_TOKEN"]
    pkce_enforcement            = "S256_REQUIRED"
    token_endpoint_auth_method  = "NONE"
    redirect_uris               = local.redirect_uris
    post_logout_redirect_uris   = ["${var.app_url}"]
  }
}

resource "pingone_application" "worker_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "Worker App"
  enabled        = true

  oidc_options = {
    type                        = "WORKER"
    grant_types                 = ["CLIENT_CREDENTIALS"]
    token_endpoint_auth_method  = "CLIENT_SECRET_BASIC"
  }
}

resource "pingone_application_secret" "worker_app" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.worker_app.id
}

##############################################
# PingOne Policies
##############################################

# PingOne Application Flow Policy
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_flow_policy_assignment}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_auth_policies_for_applications}

resource "pingone_application_flow_policy_assignment" "login_flow" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.oidc_sdk_sample_app.id
  flow_policy_id = davinci_application_flow_policy.registration_flow_app_policy.id
  priority = 1
}

##############################################
# PingOne Application Resource Grants
##############################################
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_resource_grant}
resource "pingone_application_resource_grant" "oidc_sdk_sample_app_openid" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.oidc_sdk_sample_app.id
  resource_type = "OPENID_CONNECT"
  
  scopes = [
    pingone_resource_scope_openid.profile_scope.id,
    pingone_resource_scope_openid.phone_scope.id,
    pingone_resource_scope_openid.email_scope.id
  ]
}

resource "pingone_application_resource_grant" "oidc_sdk_sample_app_revoke_scope" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.oidc_sdk_sample_app.id
  resource_type = "CUSTOM"
  custom_resource_id = pingone_resource.oidc_sdk.id

  scopes = [
    pingone_resource_scope.revoke.id
  ]
}

##############################################
# PingOne Application OIDC Scopes
##############################################

resource "pingone_resource_scope_openid" "profile_scope" {
  environment_id = pingone_environment.my_environment.id
  name           = "profile"
}

resource "pingone_resource_scope_openid" "phone_scope" {
  environment_id = pingone_environment.my_environment.id
  name           = "phone"
}

resource "pingone_resource_scope_openid" "email_scope" {
  environment_id = pingone_environment.my_environment.id
  name           = "email"
}

##############################################
# PingOne Custom Resources
##############################################

resource "pingone_resource" "oidc_sdk" {
  environment_id                = pingone_environment.my_environment.id
  name                          = "OIDC SDK"
  description                   = "Custom resources for the OIDC SDK sample app"
  audience                      = "oidc-sdk"
  access_token_validity_seconds = 3600
}

##############################################
# PingOne Resource Scopes
##############################################

resource "pingone_resource_scope" "revoke" {
  environment_id = pingone_environment.my_environment.id
  resource_id    = pingone_resource.oidc_sdk.id
  name           = "revoke"
}

##########################################################################
# Output PingOne Environment variables to local global.js file
##########################################################################

resource "local_file" "env_config" {
  content  = "window._env_ = {\n  pingOneDomain: \"${module.pingone_utils.pingone_domain_suffix}\",\n  pingOneEnvId: \"${pingone_environment.my_environment.id}\",\n  clientId: \"${pingone_application.oidc_sdk_sample_app.id}\", \n  companyId: \"${davinci_application.registration_flow_app.environment_id}\",\n  apiKey: \"${davinci_application.registration_flow_app.api_keys.prod}\",\n  policyId: \"${davinci_application_flow_policy.registration_flow_app_policy.id}\"\n};"
  filename = "../sample-app/global.js"
}

