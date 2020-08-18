# ==================== Variables

variable "opsman_password" {
  default = ""
  description = "OpsMan password to store in env variable. If this is set to empty then a random password is generated."
}

variable "pivnet_token" {
  type = string
}

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}







