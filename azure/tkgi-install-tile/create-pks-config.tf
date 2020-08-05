locals {
  pks_yml = templatefile("config/pks.yml", {
    ssl_certificate = var.ssl_certificate,
    ssl_private_key = var.ssl_private_key,
    platform_vms_security_group_name = var.platform_vms_security_group_name
    location = var.location,
    pks_as_name = var.pks_as_name,
    resource_group_name = var.resource_group_name
    subscription_id = var.subscription_id,
    tenant_id = var.tenant_id,
    network_name = var.network_name,
    environment_name = var.environment_name,
    pks_master_managed_identity = var.pks_master_managed_identity,
    pks_worker_managed_identity = var.pks_worker_managed_identity
    pks_dns = var.pks_dns,
    pks_lb_name = var.pks_lb_name

  })
}

resource "local_file" "pks_yml" {
  content  = local.pks_yml
  filename = "pks.yml"
}

