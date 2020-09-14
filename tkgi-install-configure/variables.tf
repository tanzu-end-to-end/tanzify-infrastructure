# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}


variable "iaas" {}

variable "tkgi_configuration_values" {
  description = "config values "
}

variable "tkgi_slug" {
  default = "pivotal-container-service"
}
variable "tkgi_tile_version" {
  default = "1.8.1"
}
variable "glob" {
  description = "The glob of the file to download from Pivotal Network"
  default     = ".pivotal"
}

variable "om_product" {
  description = "The name of the product in OpsManager, if it differs from the product slug"
  default     = ""
}

variable "tkgi_api_dns_domain" {
  description = "TKGI API endpoint"
}

variable "tkgi_username" {
  description = "TKGI username to create"
  default = "tanzu"
}

variable "cluster_name" {
  description = "Name of the cluster to create"
}



