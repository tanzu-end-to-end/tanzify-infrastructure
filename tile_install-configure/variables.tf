# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}


variable "iaas" {}

variable "tile_configuration_values" {
  description = "config values for the tile"
}

variable "tile_slug" {

}
variable "tile_version" {

}
variable "glob" {
  description = "The glob of the file to download from Pivotal Network"
  default     = ".pivotal"
}

variable "om_product" {
  description = "The name of the product in OpsManager, if it differs from the product slug"
  default     = ""
}





