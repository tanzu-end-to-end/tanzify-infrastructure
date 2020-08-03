# ==================== Variables
variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  type        = string
}


variable "environment_name" {
}


variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "opsman_password" {
  default = ""
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

variable "ssl_cert" {
  default = ""
}
variable "ssl_private_key" {
  default = ""
}





