# ==================== Variables

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  type        = string
}


variable "location" {
  default = ""
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
variable "environment_name" {}

variable "opsman-build" {
  type = string
}
variable "opsman_version" {
  type = string
}

variable ops_manager_ssh_public_key {
  type = string
}
variable "ops_manager_storage_account_name" {}
variable "ops_manager_storage_container_name" {}
variable "ops_manager_dns" {}
variable "ops_manager_private_ip" {}
variable "resource_group_name" {}
variable "ops_manager_security_group_name" {}
variable "subnet_id" {}
variable "ops_manager_instance_type" {
  default = "Standard_DS2_v2"
  type    = string
}


