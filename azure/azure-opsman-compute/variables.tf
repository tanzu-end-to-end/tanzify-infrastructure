# ==================== Variables

# This is where the Opsman local images are stored. Possible values are westus, eastus, westeurope, southeastasia
variable "image_location" {
  type = string
  default = "eastus"
}
variable "location" {
  type = string
  description = "Azure location"
}


variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  type        = string
}

variable "subscription_id" {
  type = string
  description = "Azure Subscription ID"
}

variable "client_id" {
  description = "Azure Client ID"
  type = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type = string
}

variable "environment_name" {
  description = "Name of the environment. This is prefixed with the hosted_zone DNS to generate the Common Name for the TLS certificate."
  type = string
}

variable "opsman_build" {
  type = string
}
variable "opsman_version" {
  type = string
}

variable ops_manager_ssh_public_key {
  type = string
}
variable ops_manager_ssh_private_key {
  type = string
}

variable "tags" {
  default = {}
  type = map(string)
  description = "Tags to apply to resources"
}

variable "ops_manager_storage_account_name" {
  description = "Output from https://github.com/pivotal/paving/azure "
}
variable "ops_manager_storage_container_name" {
  description = "Output from https://github.com/pivotal/paving/azure "
}
variable "ops_manager_dns" {
  description = "OpsMan DNS name. Output from https://github.com/pivotal/paving/azure "
}
variable "ops_manager_private_ip" {
  description = "Output from https://github.com/pivotal/paving/azure "
}
variable "resource_group_name" {
  description = "Output from https://github.com/pivotal/paving/azure "
}
variable "ops_manager_security_group_name" {
  description = "Output from https://github.com/pivotal/paving/azure "
}
variable "subnet_id" {
  description = "Output from https://github.com/pivotal/paving/azure "
}
variable "ops_manager_instance_type" {
  default = "Standard_DS2_v2"
  type    = string
}


