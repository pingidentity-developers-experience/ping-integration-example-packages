terraform {
  required_providers {
    pingone = {
      source = "pingidentity/pingone"
    }
    davinci = {
      source = "pingidentity/davinci"
    }
    http = {
      source = "hashicorp/http"
      version = "3.3.0"
    }
  }
}