terraform {
  required_providers {
    pingone = {
      source = "pingidentity/pingone"
    }
    http = {
      source = "hashicorp/http"
      version = "3.3.0"
    }
  }
}
