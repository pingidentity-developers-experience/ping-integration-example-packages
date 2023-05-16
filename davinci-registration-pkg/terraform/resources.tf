##########################################################################
# resource.tf - Declarations for PingOne resources.
# {@link https://developer.hashicorp.com/terraform/language/resources}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_c_resources}
##########################################################################

###############################################################
# Output PingOne Environment variables to local global.js file
###############################################################

resource "local_file" "env_config" {
  content  = "window._env_ = { companyId: \"${davinci_application.registration_flow_app.environment_id}\", apiKey: \"${davinci_application.registration_flow_app.api_keys.prod}\", policyId: \"${element([for s in davinci_application.registration_flow_app.policy: s.policy_id if s.status == "enabled"],0)}\"}"
  filename = "../davinci-registration-sample-app/global.js"
}