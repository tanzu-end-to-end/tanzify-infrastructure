provider "lastpass" {
  version = "~> 0.4.3"
}

variable "credential-LastPassID" {
  type = string
  description = "LastPass entry ID where the azure credentials are stored"
}

data "lastpass_secret" "credentials" {
  id = var.credential-LastPassID
}
