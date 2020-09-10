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

variable "ops_manager_dns" {}
variable "management_subnet_name" {}

variable "ops_manager_public_ip" {}

variable "ops_manager_instance_type" {
  default = "n1-standard-2"
  type    = string
}

variable "ops_man_image_creation_timeout" {
  type    = string
  default = "10m"
}




