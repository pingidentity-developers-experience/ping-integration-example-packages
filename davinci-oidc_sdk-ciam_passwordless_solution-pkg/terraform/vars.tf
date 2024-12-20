##########################################################################
# vars.tf - Contains declarations of variables and locals.
# {@link https://developer.hashicorp.com/terraform/language/values}
##########################################################################
variable "region_code" {
  type        = string
  description = "Region code that your P1 Org is in"

  validation {
    condition     = contains(["EU", "NA", "CA", "AP", "AU"], var.region_code)
    error_message = "Allowed values for region_code are \"EU\", \"NA\", \"CA\", \"AP\", \"AU\"."
  }
}

variable "license_id" {
  type        = string
  description = "Id of the P1 license you want to assign to the Environment"
}

variable "pingone_environment_id" {
  type        = string
  description = "ID of the P1 admin environment"
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
  default     = "DaVinci OIDC Passwordless Sample"
}

variable "dv_admin_region" {
  type        = string
  description = "Region your P1 Org is in"
}

variable "dv_admin_username" {
  type        = string
  description = "Username to use for the DaVinci provider"
}

variable "dv_admin_password" {
  type        = string
  description = "Password to use for the DaVinci provider"
}

variable "davinci_admin_group" {
  type        = string
  description = "Name of the group that has DaVinci Admin rights"
  default     = "DaVinci Terraform Administrators"
}

variable "assign_dv_admin_role" {
  type        = bool
  description = "Assign DaVinci Admin role to new environment. If your DaVinci Admin group is scoped to organization set this to false."
  default     = true
}

variable "app_url" {
  type        = string
  description = "Application URL"
  default     = "https://127.0.0.1:8080"
}

locals {
  # The URL of the demo app
  redirect_uris = ["${var.app_url}/dashboard.html"]
  # Translate the Region to a Domain suffix
  north_america  = var.dv_admin_region == "NorthAmerica" ? "com" : ""
  europe         = var.dv_admin_region == "Europe" ? "eu" : ""
  canada         = var.dv_admin_region == "Canada" ? "ca" : ""
  asia_pacific   = var.dv_admin_region == "AsiaPacific" ? "asia" : ""
  pingone_domain = coalesce(local.north_america, local.europe, local.canada, local.asia_pacific)
  # Worker app token variables
  raw_data     = jsondecode(data.http.get_token.response_body)
  access_token = local.raw_data.access_token
  policy_data =  jsondecode(data.http.get_risk_policy_id.response_body)
  policy_id   =  local.policy_data._embedded.riskPolicySets[0].id
}
