terraform {
  required_version = ">= 1.1.0"
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = "1.19.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.11.1"
    }
  }
}