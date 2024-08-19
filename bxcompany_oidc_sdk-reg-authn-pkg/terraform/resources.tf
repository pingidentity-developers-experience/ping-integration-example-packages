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
resource "pingone_population_default" "oidc_sdk_pop" {
  environment_id = pingone_environment.my_environment.id
  name           = "OIDC SDK Sample Users"
  description    = "OIDC SDK Sample Population"
}

##############################################
# PingOne Connections (applications)
##############################################

# PingOne Connection (application)
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_app_worker}
resource "pingone_application" "oidc_sdk_sample_app" {
  environment_id = pingone_environment.my_environment.id
  enabled        = true
  name           = "OIDC SDK Sample App"
  description    = "A custom sample OIDC application to demonstrate PingOne integration."

  oidc_options = {
    type                        = "SINGLE_PAGE_APP"
    grant_types                 = ["AUTHORIZATION_CODE", "IMPLICIT", "REFRESH_TOKEN"]
    response_types              = ["CODE", "TOKEN", "ID_TOKEN"]
    pkce_enforcement            = "S256_REQUIRED"
    token_endpoint_auth_method = "NONE"
    redirect_uris               = local.redirect_uris
    post_logout_redirect_uris   = ["${var.app_url}"]
  }
}

resource "pingone_application" "worker_app" {
  environment_id = pingone_environment.my_environment.id
  name           = "DemoWorkerApp"
  enabled        = true

  oidc_options = {
    type                        = "WORKER"
    grant_types                 = ["CLIENT_CREDENTIALS"]
    token_endpoint_auth_method = "CLIENT_SECRET_BASIC"
  }
}

resource "pingone_application_secret" "worker_app" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.worker_app.id
}

# PingOne Role Assignment
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_role_assignment}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_t_configurerolesforworkerapplication}

resource "pingone_application_role_assignment" "population_identity_data_admin_to_application" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.worker_app.id
  role_id        = data.pingone_role.identity_data_admin.id

  scope_population_id = pingone_population_default.oidc_sdk_pop.id
}

##############################################
# PingOne Policies
##############################################

# PingOne Sign-On Policy
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/sign_on_policy}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_an_auth_policy}
resource "pingone_sign_on_policy" "default_authN_policy" {
  environment_id = pingone_environment.my_environment.id
  name           = "OIDC_SDK_Sample_Policy"
  description    = "Simple Login"
}

# PingOne sign-on Policy Action
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/sign_on_policy_action}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_login_auth_step}
resource "pingone_sign_on_policy_action" "default_authN_policy_firstFactor" {
  environment_id    = pingone_environment.my_environment.id
  sign_on_policy_id = pingone_sign_on_policy.default_authN_policy.id

  registration_local_population_id = pingone_population_default.oidc_sdk_pop.id

  priority = 1

  conditions {
    last_sign_on_older_than_seconds = 28800
  }

  login {
    recovery_enabled = true
  }
}


# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_sign_on_policy_assignment}
# {@link https://docs.pingidentity.com/r/en-us/pingone/pingonemfa_associating_sign_on_policy_with_web_app?section=rxy1666194779493}
resource "pingone_application_sign_on_policy_assignment" "default_authN_policy" {
  environment_id    = pingone_environment.my_environment.id
  application_id    = pingone_application.oidc_sdk_sample_app.id
  sign_on_policy_id = pingone_sign_on_policy.default_authN_policy.id
  priority          = 1
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

##############################################
# PingOne Branding 
##############################################

resource "pingone_image" "company_logo" {
  environment_id = pingone_environment.my_environment.id

  image_file_base64 = filebase64("../sample-app/images/logo.png")
}

resource "pingone_branding_theme" "bxcompany_theme" {
  environment_id = pingone_environment.my_environment.id

  name     = "BXCompany Theme"
  template = "default"


  logo = {
    id   = pingone_image.company_logo.id
    href = pingone_image.company_logo.uploaded_image.href
  }
  background_color   = "#F8F8F8"
  button_text_color  = "#FFFFFF"
  heading_text_color = "#686F77"
  card_color         = "#FFFFFF"
  body_text_color    = "#686F77"
  link_text_color    = "#002AEC"
  button_color       = "#002AEC"
}

resource "pingone_branding_theme_default" "bxcompany_theme_active" {
  environment_id = pingone_environment.my_environment.id

  branding_theme_id = pingone_branding_theme.bxcompany_theme.id
}

###############################################################
# Output PingOne Environment variables to local global.js file
###############################################################

resource "local_file" "env_config" {
  content  = "window._env_ = { pingOneDomain: \"${module.pingone_utils.pingone_domain_suffix}\", pingOneEnvId: \"${pingone_environment.my_environment.id}\", clientId: \"${pingone_application.oidc_sdk_sample_app.id}\"}"
  filename = "../sample-app/global.js"
}