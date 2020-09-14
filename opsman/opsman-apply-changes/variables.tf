# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}

variable "product-names" {
  default = [""]
  type = list(string)
  description = "The product names to apply if any. If empty it will apply all changes"
}







