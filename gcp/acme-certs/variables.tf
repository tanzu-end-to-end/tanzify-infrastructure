# ==================== Variables

variable "region" {
}

variable "service_account_key" {

}
variable "project" {

}

variable "environment_name" {
  type = string
}

variable "hosted_zone" {
  description = "Google Cloud DNS Zone Name that has the root domain registered"
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






