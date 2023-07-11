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

##############################################
# PingOne Connections (applications)
##############################################

# PingOne Connection (application)
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_app_worker}
resource "pingone_application" "pop_api_sample_app" {
  environment_id = module.environment.environment_id
  enabled        = true
  name           = "Protect API Sample App"
  description    = "A custom sample application to demonstrate PingOne Protect with JavaScript."

  oidc_options {
    type                        = "SINGLE_PAGE_APP"
    grant_types                 = ["AUTHORIZATION_CODE", "IMPLICIT", "REFRESH_TOKEN"]
    response_types              = ["CODE", "TOKEN", "ID_TOKEN"]
    pkce_enforcement            = "S256_REQUIRED"
    token_endpoint_authn_method = "NONE"
    redirect_uris               = local.redirect_uris
    post_logout_redirect_uris   = ["${local.app_url}"]
  }
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
# PingOne Policies
##############################################

# PingOne Sign-On Policy
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/sign_on_policy}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_an_auth_policy}
resource "pingone_sign_on_policy" "default_authN_policy" {
  environment_id = module.environment.environment_id
  name           = "Protect_API_Sample_Policy"
  description    = "Simple Login"
}

# PingOne sign-on Policy Action
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/sign_on_policy_action}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_add_login_auth_step}
resource "pingone_sign_on_policy_action" "default_authN_policy_firstFactor" {
  environment_id    = module.environment.environment_id
  sign_on_policy_id = pingone_sign_on_policy.default_authN_policy.id

  registration_local_population_id = pingone_population.pop_api.id

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
  environment_id    = module.environment.environment_id
  application_id    = pingone_application.pop_api_sample_app.id
  sign_on_policy_id = pingone_sign_on_policy.default_authN_policy.id
  priority          = 1
}

##############################################
# PingOne Application Resource Grants
##############################################
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/application_resource_grant}
resource "pingone_application_resource_grant" "pop_api_sample_app_openid" {
  environment_id = module.environment.environment_id
  application_id = pingone_application.pop_api_sample_app.id
  resource_id    = data.pingone_resource.openid.id

  scopes = [
    data.pingone_resource_scope.openid_profile.id,
    data.pingone_resource_scope.openid_phone.id,
    data.pingone_resource_scope.openid_email.id
  ]
}

resource "pingone_application_resource_grant" "pop_api_sample_app_revoke_scope" {
  environment_id = module.environment.environment_id
  application_id = pingone_application.pop_api_sample_app.id
  resource_id    = pingone_resource.protect_api.id
  
  scopes = [
    pingone_resource_scope.revoke.id
  ]
}

##############################################
# PingOne Application OIDC Scopes
##############################################

resource "pingone_resource_scope_openid" "profile_scope" {
  environment_id = module.environment.environment_id
  name           = "profile"
}

resource "pingone_resource_scope_openid" "phone_scope" {
  environment_id = module.environment.environment_id
  name           = "phone"
}

resource "pingone_resource_scope_openid" "email_scope" {
  environment_id = module.environment.environment_id
  name           = "email"
}

##############################################
# PingOne Custom Resources
##############################################

resource "pingone_resource" "protect_api" {
  environment_id = module.environment.environment_id
  name           = "Protect API"
  description    = "Custom resources for the Protect API sample app"
  audience       = "protect-api"
  access_token_validity_seconds = 3600
}

##############################################
# PingOne Resource Scopes
##############################################

resource "pingone_resource_scope" "revoke" {
  environment_id = module.environment.environment_id
  resource_id    = pingone_resource.protect_api.id
  name           = "revoke"
}

###############################################################
# Output PingOne Environment variables to local .env file
###############################################################

resource "local_file" "env" {
  content  = "P1_ENV_ID=\"${module.environment.environment_id}\"\nP1_WORKER_CLIENT_ID=\"${pingone_application.worker_app.oidc_options[0].client_id}\"\nP1_WORKER_CLIENT_SECRET=\"${pingone_application.worker_app.oidc_options[0].client_secret}\""
  filename = "../ping-one-protect-sample-app/.env"
}