# ==================== Variables

variable "location" {}
variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}
variable "resource_group_name" {}
variable "environment_name" {}

variable "azure_network_name" {}
variable "ssl_certificate" {}
variable "ssl_private_key" {}
variable "platform_vms_security_group_name" {}
variable "pks_as_name" {}
variable "pks_master_managed_identity" {}
variable "pks_worker_managed_identity" {}
variable "pks_dns" {}
variable "pks_lb_name" {}

variable "azs" {
  type = list
  default = ["zone-1", "zone-2", "zone-3"]
}

locals {
  pks_yaml = templatefile("config/pks.yml", {
    network_name = var.azure_network_name,
    ssl_certificate = var.ssl_certificate,
    ssl_private_key = var.ssl_private_key,
    platform_vms_security_group_name = var.platform_vms_security_group_name
    location = var.location,
    pks_as_name = var.pks_as_name,
    resource_group_name = var.resource_group_name
    subscription_id = var.subscription_id,
    tenant_id = var.tenant_id,
    network_name = var.azure_network_name,
    environment_name = var.environment_name,
    pks_master_managed_identity = var.pks_master_managed_identity,
    pks_worker_managed_identity = var.pks_worker_managed_identity
    pks_dns = var.pks_dns,
    pks_lb_name = var.pks_lb_name

  })
}

output "hello" {
  value = local.pks_yaml
}



