##########################################################################
# resource.tf - Declarations for PingOne resources.
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

##########################################################################
# Output PingOne Environment variables to local global.js file
##########################################################################

resource "local_file" "env_config" {
  content  = "window._env_ = {\n  pingOneDomain: \"${local.pingone_domain}\",\n  companyId: \"${davinci_application.registration_flow_app.environment_id}\",\n  apiKey: \"${davinci_application.registration_flow_app.api_keys.prod}\",\n  policyId: \"${element([for s in davinci_application.registration_flow_app.policy : s.policy_id if s.status == "enabled"], 0)}\"\n};"
  filename = "../sample-app/global.js"
}