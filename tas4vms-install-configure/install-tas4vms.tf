
locals {
  opman_product = var.om_product == "" ? var.tas4vms_slug : var.om_product
}


resource "null_resource" "configure_tas4vms" {

  // copy config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/srt.yml"
    destination = "~/config/srt.yml"
  }

  // copy ops file with values
  provisioner "file" {
    content     = var.tas4vms_configuration_values
    destination = "~/config/srt-config-vars.yml"
  }


  provisioner "remote-exec" {
    inline = ["wrap install_tile ${var.tas4vms_slug} ${var.tas4vms_tile_version} ${var.glob} ${var.iaas} ${local.opman_product}"]
  }

  provisioner "remote-exec" {
    inline = ["wrap configure_tile_with_vars ~/config/srt.yml ~/config/srt-config-vars.yml"]
  }
  provisioner "remote-exec" {
    inline = ["wrap apply_changes cf"]
  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}
