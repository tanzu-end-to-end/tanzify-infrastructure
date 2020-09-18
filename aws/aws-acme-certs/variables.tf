# ==================== Variables

variable "region" {
  type = string
  description = "AWS Region"
}
variable "secret_key" {
  type = string
description = "AWS secret key"
}
variable "access_key" {
  type = string
  description = "AWS Access Key"

}
variable "environment_name" {
  type = string
  description = "Name of the environment. This is prefixed with the hosted_zone DNS to generate the Common Name for the TLS certificate."
}


variable "hosted_zone" {
  description = "DNS  name (e.g. foo.example.com) that is registered with Route53"
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






