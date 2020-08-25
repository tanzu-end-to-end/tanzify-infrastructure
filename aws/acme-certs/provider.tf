
provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 0.12.0"
}

provider tls {
  version = "~> 2.1"
} 
