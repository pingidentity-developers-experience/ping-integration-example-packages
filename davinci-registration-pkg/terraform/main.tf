##########################################################################
# main.tf - Declarations for modules and providers to 
# create infrastructure.
# {@link https://developer.hashicorp.com/terraform/language/modules}
# {@link https://developer.hashicorp.com/terraform/language/providers}
##########################################################################

##############################################
# PingOne Module
##############################################

# PingOne Environment Module
# {@link https://registry.terraform.io/modules/terraform-pingidentity-modules/environment/pingone/latest?tab=inputs}

module "environment" {
  source  = "terraform-pingidentity-modules/environment/pingone"
  version = "0.0.12"

  target_environment_name            = var.env_name
  target_environment_description     = "DaVinci Registration Sample App integration environment provisioned with Terraform. By PingIdentity, Technical Enablement."
  target_environment_production_type = false // The default.

  admin_user_assign_environment_admin_role = false
  admin_user_assign_identity_admin_role    = false
  admin_user_id_list = [
    var.admin_user_id
  ]
  create_davinci = true
  create_mfa = true

  license_id    = var.license_id
  organization_id = var.organization_id
}

##############################################
# PingOne Provider
##############################################
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs}

provider "pingone" {
  client_id                    = var.worker_id
  client_secret                = var.worker_secret
  environment_id               = var.admin_env_id
  region                       = var.region
  force_delete_production_type = false
}

##############################################
# PingOne DaVinci Provider
##############################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs}

provider "davinci" {
  username                     = var.admin_username
  password                     = var.admin_password
  region                       = var.region
  environment_id               = var.admin_env_id
}