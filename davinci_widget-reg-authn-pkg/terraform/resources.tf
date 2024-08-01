##########################################################################
# resources.tf - Declarations for PingOne resources.
# {@link https://developer.hashicorp.com/terraform/language/resources}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_resources}
##########################################################################

// Add new environment to DaVinci Admin group
resource "pingone_group_role_assignment" "single_environment_admin_to_group" {
  count          = var.assign_dv_admin_role ? 1 : 0
  environment_id = var.pingone_environment_id
  group_id       = data.pingone_group.davinci_admin.id
  role_id        = data.pingone_role.davinci_admin.id

  scope_environment_id = pingone_environment.my_environment.id
}

##########################################################################
# Output PingOne Environment variables to local global.js file
##########################################################################

resource "local_file" "env_config" {
  content  = "window._env_ = {\n  pingOneDomain: \"${module.pingone_utils.pingone_domain_suffix}\",\n  companyId: \"${davinci_application.registration_flow_app.environment_id}\",\n  apiKey: \"${davinci_application.registration_flow_app.api_keys.prod}\",\n  policyId: \"${davinci_application_flow_policy.registration_flow_app_policy.id}\"\n};"
  filename = "../sample-app/global.js"
}