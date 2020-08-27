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






