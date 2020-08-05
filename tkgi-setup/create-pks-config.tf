
data "template_file" "pks_config" {
  template = chomp(file("${path.module}/config/pks.yml"))
  vars = {
    ssl_certificate = jsonencode(var.ssl_certificate)
    ssl_private_key = jsonencode(var.ssl_private_key)
    platform_vms_security_group_name = var.platform_vms_security_group_name
    location = var.location
    pks_as_name = var.pks_as_name
    resource_group_name = var.resource_group_name
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
    network_name = var.network_name
    environment_name = var.environment_name
    pks_master_managed_identity = var.pks_master_managed_identity
    pks_worker_managed_identity = var.pks_worker_managed_identity
    pks_dns = var.pks_dns
    pks_lb_name = var.pks_lb_name
  }
}

/*
resource "random_string" "pks_password" {
  length  = 8
  special = false
}

data "template_file" "pks_script_setup" {
  template = chomp(file("${path.module}/templates/setup_pks.sh"))

  vars = {
    api_endpoint = var.api_domain
    pks_password = random_string.pks_password.result
    pks_version  = local.tile_versions["pks"]
  }
}

resource "null_resource" "setup_pks" {
  depends_on = ["null_resource.setup_opsman"]

  provisioner "file" {
    content     = data.template_file.pks_config.rendered
    destination = "~/config/cf-config.yml"
  }

  provisioner "file" {
    content     = file("${path.module}/config/setup_pks.sh")
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = ["wrap configure_tile cf"]
  }

  connection {
    host        = "${var.opsman_host}"
    user        = "ubuntu"
    private_key = "${var.opsman_ssh_key}"
  }
}
*/


