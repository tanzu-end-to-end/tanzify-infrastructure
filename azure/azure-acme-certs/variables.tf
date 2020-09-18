# ==================== Variables
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



variable "hosted_zone" {
  description = "Hosted zone name (e.g. foo.example.com) that is registered with Azure DNS."
  type        = string
}

variable "subject_alternative_names" {
  type = list
  description = "SANs to support. Put your wildcard and subdomains here."
}

variable "acme_server_url" {
  default = "https://acme-v02.api.letsencrypt.org/directory"
  description = "ACME API service endpoint. Points to LetsEncrypt by default."
}






