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

resource "pingone_environment" "my_environment" {
  name        = var.env_name
  description = "DaVinci API Registration Sample App integration environment provisioned with Terraform. By PingIdentity, Technical Enablement."
  type        = "SANDBOX"
  license_id  = var.license_id

  services = [
    {
      type = "SSO"
    },
    {
      type = "MFA"
    },
    {
      type = "DaVinci"
    }
  ]
}

# PingOne Utilities Module
# {@link https://registry.terraform.io/modules/pingidentity/utils/pingone/latest}
module "pingone_utils" {
  source  = "pingidentity/utils/pingone"
  version = "0.1.0"

  environment_id = pingone_environment.my_environment.id
  region_code    = var.region_code
}

##############################################
# PingOne Provider
##############################################
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs}

provider "pingone" {
  client_id                    = var.worker_id
  client_secret                = var.worker_secret
  environment_id               = var.pingone_environment_id
  region_code                  = var.region_code
}

##############################################
# PingOne DaVinci Provider
##############################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs}

provider "davinci" {
  username       = var.dv_admin_username
  password       = var.dv_admin_password
  region         = var.region
  environment_id = var.pingone_environment_id
}