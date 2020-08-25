# ==================== Variables


variable "region" {
}
variable "secret_key" {

}
variable "access_key" {

}
variable "environment_name" {}

variable "opsman-build" {
  type = string
}
variable "opsman_version" {
  type = string
}

variable "availability_zones" {
  description = "Requires exactly THREE availability zones that must belong to the provided region."
  type        = list
}

variable ops_manager_ssh_public_key {
  type = string
}
variable ops_manager_ssh_private_key {
  type = string
}

variable "management_subnet_name" {}


variable "ops_manager_instance_type" {
  default = "n1-standard-2"
  type    = string
}

variable "ops_man_image_creation_timeout" {
  type    = string
  default = "10m"
}



