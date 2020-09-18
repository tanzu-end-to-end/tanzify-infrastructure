

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

variable "network_name" {
  description = "Output from https://github.com/pivotal/paving/gcp "
}
