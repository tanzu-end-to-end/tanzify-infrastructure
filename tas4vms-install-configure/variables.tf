# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}


variable "iaas" {}

variable "tas4vms_configuration_values" {
  description = "config values "
}

variable "tas4vms_slug" {
  default = "srt"
}
variable "tas4vms_tile_version" {
  default = "2.10.1"
}
variable "glob" {
  description = "The glob of the file to download from Pivotal Network"
  default     = ".pivotal"
}

variable "om_product" {
  description = "The name of the product in OpsManager, if it differs from the product slug"
  default     = ""
}




