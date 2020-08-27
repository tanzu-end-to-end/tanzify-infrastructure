terraform {
  required_providers {
    acme = {
      source = "terraform-providers/acme"
    }
    google = {
      source = "hashicorp/google"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }
  required_version = ">= 0.13"
}
