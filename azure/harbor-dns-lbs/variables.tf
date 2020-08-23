variable "location" {
}

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
variable "environment_name" {}

variable "tags" {
  default = ""
}

variable "resource_group_name" {}

variable "hosted_zone" {}