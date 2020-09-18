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

variable "opsman_build" {
  type = string
}
variable "opsman_version" {
  type = string
}

variable "availability_zones" {
  description = "Requires exactly THREE availability zones that must belong to the provided region."
  type        = list
}

variable "ops_manager_ssh_public_key" {
  type = string
}

variable "ops_manager_ssh_private_key" {
  type = string
}

variable "ops_manager_dns" {
  description = "OpsMan DNS name. Output from https://github.com/pivotal/paving/gcp "
}
variable "management_subnet_name" {
  description = "Output from https://github.com/pivotal/paving/gcp "
}

variable "ops_manager_public_ip" {
  description = "Output from https://github.com/pivotal/paving/gcp "
}

variable "ops_manager_instance_type" {
  default = "n1-standard-2"
  type    = string
}

variable "ops_man_image_creation_timeout" {
  type    = string
  default = "10m"
}




