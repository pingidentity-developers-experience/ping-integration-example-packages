##########################################################################
# data.tf - Declarations for PingOne data.
# {@link https://developer.hashicorp.com/terraform/language/data-sources}
##########################################################################

# PingOne Application Roles
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/role}
# {@link https://docs.pingidentity.com/r/en-us/pingone/p1_t_configurerolesforworkerapplication}

data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}

data "pingone_role" "davinci_admin" {
  name = "DaVinci Admin"
}

# PingOne Groups
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/group}

data "pingone_group" "davinci_admin" {
  environment_id = var.pingone_environment_id

  name = var.davinci_admin_group
}

##############################################
# DaVinci Data
##############################################
data "pingone_user" "dv_admin_user" {
  environment_id = var.pingone_environment_id

  username = var.dv_admin_username
}

data "davinci_connection" "ping_sso" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "pingone_protect" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne Protect"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "variables" {
  environment_id = pingone_environment.my_environment.id
  name           = "Variables"
  depends_on     = [data.davinci_connections.read_all]
}

data "davinci_connection" "http_connector" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  name           = "Http"
}
