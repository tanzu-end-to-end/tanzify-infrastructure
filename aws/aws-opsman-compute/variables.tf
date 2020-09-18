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
  description = "Name of the environment. This is used for naming compute resource."
}

variable "opsman_build" {
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
variable "ops_manager_security_group_id" {
  description = "Output from https://github.com/pivotal/paving/aws "
}

variable "public_subnet_ids" {
  description = "Output from https://github.com/pivotal/paving/aws "
  type = list(string)
}
variable "ops_manager_iam_instance_profile_name" {
  description = "Output from https://github.com/pivotal/paving/aws "
}

variable "ops_manager_dns" {
  description = "OpsMan DNS name. Output from https://github.com/pivotal/paving/aws"
}
variable "ops_manager_instance_type" {
  default = "r4.large"
  type    = string
}

variable "tags" {
  default = {}
  type = map(string)
  description = "Tags to apply to resources"
}

variable "ops_manager_public_ip" {
  description = "Public IP of OpsMan"

}


