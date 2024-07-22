terraform {
  required_version = ">= 1.1.0"
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = "0.29.2"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.3.0"
    }
  }
}
