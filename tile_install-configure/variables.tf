# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}


variable "iaas" {
  description = "aws/azure/gcp"
}

variable "tile_configuration_values" {
  description = "configuration values in yaml/json format that will be used by 'om configure-product' to configure the tile"
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





