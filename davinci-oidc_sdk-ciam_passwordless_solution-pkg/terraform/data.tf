##########################################################################
# data.tf - Declarations for PingOne data.
# {@link https://developer.hashicorp.com/terraform/language/data-sources}
##########################################################################

##############################################
# PingOne Scopes
##############################################

data "pingone_resource" "openid" {
  environment_id = pingone_environment.my_environment.id
  name           = "openid"
}

# OIDC Scopes
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/resource_scope}
# {@link https://docs.pingidentity.com/r/en-us/pingone/pingone_viewing_oidc_attributes_for_an_application}
# OAuth Scopes

data "pingone_resource_scope" "openid_profile" {
  environment_id = pingone_environment.my_environment.id
  resource_id    = data.pingone_resource.openid.id
  name           = "profile"
}

data "pingone_resource_scope" "openid_phone" {
  environment_id = pingone_environment.my_environment.id
  resource_id    = data.pingone_resource.openid.id
  name           = "phone"
}

data "pingone_resource_scope" "openid_email" {
  environment_id = pingone_environment.my_environment.id
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

data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}

data "pingone_role" "davinci_admin" {
  name = "DaVinci Admin"
}

##############################################
# DaVinci Data
##############################################
data "pingone_user" "dv_admin_user" {
  environment_id = var.pingone_environment_id

  username = var.admin_username
}

data "davinci_connection" "ping_sso" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "pingone_mfa" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne MFA"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "variables" {
  environment_id = pingone_environment.my_environment.id
  name           = "Variables"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "annotation" {
  environment_id = pingone_environment.my_environment.id
  name           = "Annotation"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "error_message" {
  environment_id = pingone_environment.my_environment.id
  name           = "Error Message"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "functions" {
  environment_id = pingone_environment.my_environment.id
  name           = "Functions"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "pingone_notifications" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne Notifications"
  depends_on     = [data.davinci_connections.read_all]
}

# Terraform HTTP provider
# {@link https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http}

##############################################
# Get PingOne Worker App Token
##############################################

data "http" "get_token" {
  url    = "https://auth.pingone.${local.pingone_domain}/${pingone_environment.my_environment.id}/as/token"
  method = "POST"
  depends_on = [
    pingone_application_role_assignment.population_identity_data_admin_to_application
  ]

  # Optional request headers
  request_headers = {
    Content-Type  = "application/x-www-form-urlencoded",
    Authorization = "Basic ${base64encode("${pingone_application.worker_app.oidc_options[0].client_id}:${pingone_application.worker_app.oidc_options[0].client_secret}")}"
  }

  # Optional request body
  request_body = "grant_type=client_credentials"
}

# Create PingOne User
# {@link https://apidocs.pingidentity.com/pingone/platform/v1/api/#post-create-user-import}

data "http" "create_demo_user" {
  url    = "https://api.pingone.${local.pingone_domain}/v1/environments/${pingone_environment.my_environment.id}/users"
  method = "POST"

  # Optional request headers
  request_headers = {
    Accept        = "application/json",
    Content-Type  = "application/vnd.pingidentity.user.import+json",
    Authorization = "Bearer ${local.access_token}",
  }

  # Optional request body"
  request_body = "{\"email\":\"demouser1@mailinator.com\",\"name\":{\"given\": \"Demo\",\"family\":\"User\"},\"username\":\"demouser1\",\"population\":{\"id\":\"${pingone_population.oidc_sdk_pop.id}\"},\"lifecycle\":{\"status\":\"ACCOUNT_OK\"},\"password\":{\"value\":\"2FederateM0re!\",\"forceChange\": false}}"
}
