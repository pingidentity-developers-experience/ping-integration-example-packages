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
  description = "Protect API Sample App integration environment provisioned with Terraform. By PingIdentity, Technical Enablement."
  type        = "SANDBOX"
  license_id  = var.license_id

  service {
    type = "Risk"
  }
}

# PingOne Environment (Data Source)
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/data-sources/environment}
data "pingone_environment" "administrators" {
  name = "Administrators"
}

# PingOne Utilities Module
# {@link https://registry.terraform.io/modules/pingidentity/utils/pingone/latest}
module "pingone_utils" {
  source  = "pingidentity/utils/pingone"
  version = "0.0.8"

  environment_id = pingone_environment.my_environment.id
  region         = var.region
}

##############################################
# PingOne Provider
##############################################

# PingOne Provider
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs}
provider "pingone" {
  client_id                    = var.worker_id
  client_secret                = var.worker_secret
  environment_id               = var.pingone_environment_id
  region                       = var.region
}

provider "http" {
  # Configuration options
}
