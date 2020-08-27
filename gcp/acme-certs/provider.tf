
provider "google" {
  project     = var.project
  region      = var.region
  credentials = jsondecode(var.service_account_key)

}

terraform {
  required_version = ">= 0.12.0"
}

provider tls {
  version = "~> 2.1"
}
