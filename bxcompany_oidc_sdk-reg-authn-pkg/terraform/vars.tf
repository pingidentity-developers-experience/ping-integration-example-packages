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
  default     = "BXCompany OIDC SDK Example"
}

variable "app_url" {
  type        = string
  description = "Application URL"
  default     = "https://127.0.0.1:8080"
}

locals {
  # The URL of the demo app
  redirect_uris = ["${var.app_url}/dashboard.html"]
  # Worker app token variables
  raw_data     = jsondecode(data.http.get_token.response_body)
  access_token = local.raw_data.access_token
}
