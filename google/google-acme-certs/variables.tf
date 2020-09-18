# ==================== Variables

variable "region" {
  description = "GCP Region"
}

variable "service_account_key" {
description = "GCP Service Account Key in JSON format"
}
variable "project" {
  description = "GCP Project Name"

}

variable "environment_name" {
  description = "Name of the environment. This is prefixed with the hosted_zone DNS to generate the Common Name for the TLS certificate."
  type = string
}

variable "hosted_zone" {
  description = "The name of the Google Cloud DNS zone managing the DNS for a domain (e.g. foo.example.com) "
  type        = string
}

variable "subject_alternative_names" {
  type = list
  description = "SANs to support. Put your wildcard and subdomains here."
  default = ["opsmanager", "*.apps", "*.sys", "*.uaa.sys", "*.login.sys", "*.pks", "harbor"]
}

variable "acme_server_url" {
  default = "https://acme-v02.api.letsencrypt.org/directory"
  description = "ACME API service endpoint. Points to LetsEncrypt by default."
}






