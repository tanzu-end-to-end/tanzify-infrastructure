
terraform {
  required_providers {
    lastpass = "~> 0.5.0"
  }
}


variable "credential-LastPassID" {
  type = string
  description = "LastPass entry ID where the credentials are stored. To find the ID use the LastPass CLI and run 'lpass ls | grep <name_of_secret>'"
}

data "lastpass_secret" "credentials" {
  id = var.credential-LastPassID
}

output "id" {
  value = data.lastpass_secret.credentials.id
}
