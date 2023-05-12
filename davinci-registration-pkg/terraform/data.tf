##########################################################################
# data.tf - Declarations for PingOne data.
# {@link https://developer.hashicorp.com/terraform/language/data-sources}
##########################################################################

##############################################
# PingOne Scopes
##############################################

data "pingone_resource" "openid" {
  environment_id = module.environment.environment_id
  name           = "openid"
}

# OIDC Scopes
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/resource_scope}
# {@link https://docs.pingidentity.com/r/en-us/pingone/pingone_viewing_oidc_attributes_for_an_application}
# OAuth Scopes

data "pingone_resource_scope" "openid_profile" {
  environment_id = module.environment.environment_id
  resource_id    = data.pingone_resource.openid.id
  name           = "profile"
}

data "pingone_resource_scope" "openid_phone" {
  environment_id = module.environment.environment_id
  resource_id    = data.pingone_resource.openid.id
  name           = "phone"
}

data "pingone_resource_scope" "openid_email" {
  environment_id = module.environment.environment_id
  resource_id    = data.pingone_resource.openid.id
  name           = "email"
}

# PingOne Application Roles
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/role}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_t_configurerolesforworkerapplication}
# Identity Data Admin Role

data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

# Terraform HTTP provider
# {@link https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http}

##############################################
# Get PingOne Worker App Token
##############################################

data "http" "get_token" {
  url    = "https://auth.pingone.com/${module.environment.environment_id}/as/token"
  method = "POST"
  depends_on = [
    pingone_application_role_assignment.population_identity_data_admin_to_application
  ]

  # Optional request headers
  request_headers = {
    Content-Type = "application/x-www-form-urlencoded",
    Authorization = "Basic ${base64encode("${pingone_application.worker_app.oidc_options[0].client_id}:${pingone_application.worker_app.oidc_options[0].client_secret}")}"
  }

  # Optional request body
  request_body = "grant_type=client_credentials"
}
