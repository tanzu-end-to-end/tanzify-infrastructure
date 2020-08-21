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

variable "environment_name" {
  type = string
}

variable "location" {
  type = string
}


variable "hosted_zone" {
  description = "Hosted zone name (e.g. foo.example.com)"
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






