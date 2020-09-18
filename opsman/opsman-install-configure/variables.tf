# ==================== Variables

variable "opsman_password" {
  type = string
  description = "OpsMan password"
}

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}

variable "ssl_cert" {
  description = "TLS Public certificate to be used for OpsMan"

}
variable "ssl_private_key" {
  description = "TLS Private certificate to be used for OpsMan"
}

variable "iaas" {
  description = "aws or azure or google"
}

variable "vm_extensions" {
  type = list
  default = []
}
variable "opsman_configuration_values" {
description = "JSON Encoded config values. Output of one of the modules of https://github.com/pivotal/paving"
}

variable "map_extra_opsman_configuration_values" {
 type = map(string)
  default = {}
  description = "Map of values that will be json encoded and merged with opsman_configuration_values to be used with om cli tool to configure-director"
}





