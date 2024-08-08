##########################################################################
# vars.tf - Contains declarations of variables and locals.
# {@link https://developer.hashicorp.com/terraform/language/values}
##########################################################################
variable "region_code" {
  type        = string
  description = "Region code that your P1 Org is in"
}

variable "license_id" {
  type        = string
  description = "Id of the P1 license you want to assign to the Environment"
}

variable "pingone_environment_id" {
  type        = string
  description = "P1 Environment containing the Worker App"
}

variable "admin_user_id" {
  type        = string
  description = "PingOne userID to grant identity admin role for new environment"
}

variable "worker_id" {
  type        = string
  description = "Worker App ID App - App must have sufficient Roles"
  sensitive   = true
}

variable "worker_secret" {
  type        = string
  description = "Worker App Secret - App must have sufficient Roles"
  sensitive   = true
}

variable "env_name" {
  type        = string
  description = "Name used for the PingOne Environment"
  default     = "Protect API Example"
}

locals {
  # Translate the Region to a Domain suffix
  north_america   = var.region_code == "NA" ? "com" : ""
  europe          = var.region_code == "EU" ? "eu" : ""
  canada          = var.region_code == "CA" ? "ca" : ""
  asia_pacific_ap = var.region_code == "AP" ? "asia" : ""
  asia_pacific_au = var.region_code == "AU" ? "com.au" : ""
  pingone_domain  = coalesce(local.north_america, local.europe, local.canada, local.asia_pacific_ap, local.asia_pacific_au)
  # Worker app token variables
  raw_data     = jsondecode(data.http.get_token.response_body)
  access_token = local.raw_data.access_token
}
