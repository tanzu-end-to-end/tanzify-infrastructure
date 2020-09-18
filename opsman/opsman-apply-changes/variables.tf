# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
  description = "SSH Private Key to login to OpsMan"
}

variable "ops_manager_dns" {
  type = string
  description = "OpsMan DNS Name"
}

variable "product-names" {
  default = [""]
  type = list(string)
  description = "The product names to apply if any. If empty it will apply all changes"
}







