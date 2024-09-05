terraform {
  required_version = ">= 1.1.0"
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 1.1, < 1.2"
    }
    davinci = {
      source  = "pingidentity/davinci"
      version = "0.4.4"
    }
    time = {
      source = "hashicorp/time"
      version = "0.11.1"
    }
  }
}