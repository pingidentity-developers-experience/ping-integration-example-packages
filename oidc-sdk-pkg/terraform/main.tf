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
  target_environment_description     = "OIDC SDK Sample App integration environment provisioned with Terraform. By PingIdentity, Technical Enablement."
  target_environment_production_type = false // The default.

  admin_user_assign_environment_admin_role = false
  admin_user_assign_identity_admin_role    = true
  admin_user_id_list = [
    var.admin_user_id
  ]

  license_name    = var.license_name
  organization_id = var.organization_id
}

##############################################
# PingOne Provider
##############################################

# PingOne Provider
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs}
provider "pingone" {
  client_id                    = var.worker_id
  client_secret                = var.worker_secret
  environment_id               = var.admin_env_id
  region                       = var.region
  force_delete_production_type = false
}

provider "http" {
  # Configuration options
}
