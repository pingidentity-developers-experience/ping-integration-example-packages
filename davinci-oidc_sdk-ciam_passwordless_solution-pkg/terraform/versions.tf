terraform {
  required_version = ">= 1.1.0"
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 0.26.0, < 1.0.0"
    }
    davinci = {
      source  = "pingidentity/davinci"
      version = ">= 0.1.5, < 1.0.0"
    }
  }
}