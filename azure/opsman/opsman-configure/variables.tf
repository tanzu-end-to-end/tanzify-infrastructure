# ==================== Variables

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  type        = string
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


variable ops_manager_ssh_private_key
{
  type = string
}

variable ops_manager_ssh_public_key
{
  type = string
}



variable "azure_network_name" {}

variable "azure_management_subnet_name" {}

variable "azure_management_subnet_cidrs" { type = list}

variable "azure_management_subnet_gateway" {}

variable azure_pas_subnet_name {}

variable "azure_pas_subnet_cidrs" {type = list}

variable "azure_pas_subnet_gateway" {}

variable "azure_services_subnet_name" {}

variable "azure_services_subnet_cidrs" { type = list}

variable "azure_services_subnet_gateway" {}

variable "azure_pcf_resource_group_name" {}

variable "azure_bosh_root_storage_account" {}


variable "azs" {
  type = list
  default = ["zone-1", "zone-2", "zone-3"]
}



