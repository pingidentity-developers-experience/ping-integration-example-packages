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
