# ==================== Variables

variable "slug" {
  description = "The Pivotal Network product slug to install"
  default = "pivotal-container-service"
}

variable "tile_version" {
  description = "The version of the product to install"
  default = "1.8.1"
}

variable "glob" {
  description = "The glob of the file to download from Pivotal Network"
  default     = ".pivotal"
}

variable "iaas" {
  description = "The IaaS (AWS, GCP etc) for which to download the stemcell"
}

variable "om_product" {
  description = "The name of the product in OpsManager, if it differs from the product slug"
  default     = ""
}




