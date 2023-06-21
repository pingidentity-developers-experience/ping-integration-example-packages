##########################################################################
# data.tf - Declarations for PingOne data.
# {@link https://developer.hashicorp.com/terraform/language/data-sources}
##########################################################################

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

##############################################
# DaVinci Data
##############################################
data "pingone_user" "dv_admin_user" {
  environment_id = var.admin_env_id

  username = var.admin_username
}

data "davinci_connection" "ping_sso" {
  environment_id = module.environment.environment_id
  name = "PingOne"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "pingone_risk" {
  environment_id = module.environment.environment_id
  name = "PingOne Risk"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "variables" {
  environment_id = module.environment.environment_id
  name = "Variables"
  depends_on     = [data.davinci_connections.read_all]
}