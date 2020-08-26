# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}

variable "product-name" {
  default = ""
  type = string
  description = "The product name to apply if any. If empty it will apply all changes"
}







