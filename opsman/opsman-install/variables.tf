# ==================== Variables

variable "opsman_password" {
}

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}

variable "ssl_cert" {

}
variable "ssl_private_key" {

}

variable "iaas" {}

variable "vm_extensions" {
  type = "list"
  default = []
}
variable "opsman_configuration_values" {

}






