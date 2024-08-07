terraform {
  required_version = ">= 1.1.0"
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = "0.29.2"
    }
    davinci = {
      source  = "pingidentity/davinci"
      version = "0.3.3"
    }
    time = {
      source = "hashicorp/time"
      version = "0.11.1"
    }
  }
}