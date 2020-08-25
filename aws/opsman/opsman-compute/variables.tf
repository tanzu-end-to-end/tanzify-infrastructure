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

variable ops_manager_ssh_public_key {
  type = string
}
variable ops_manager_ssh_private_key {
  type = string
}
variable "ops_manager_security_group_id" {}

variable "public_subnet_ids" {}
variable "ops_manager_iam_instance_profile_name" {}


variable "ops_manager_instance_type" {
  default = "r4.large"
  type    = string
}

variable "tags" {
  default = {}
  type = map(string)
  description = "Tags to apply to resources"
}


