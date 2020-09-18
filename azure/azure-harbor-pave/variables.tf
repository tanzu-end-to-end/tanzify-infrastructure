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

variable "tags" {
  description = "Key/value tags to assign to all resources."
  default     = {}
  type        = map(string)
}


variable "resource_group_name" {
  description = "Azure Resource Group. "
}

variable "hosted_zone" {
  description = "Hosted zone name (e.g. foo.example.com) that is registered with Azure DNS."
  type        = string
}
