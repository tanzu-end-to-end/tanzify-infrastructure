
locals {
  opman_product = var.om_product == "" ? var.slug : var.om_product
}

resource "null_resource" "stage_tile" {

  provisioner "file" {
    content     = var.config
    destination = "~/config/${local.opman_product}-config.yml"
  }

  provisioner "file" {
    content     = var.ops_file
    destination = "~/config/${local.opman_product}-config-ops.yml"
  }

  provisioner "remote-exec" {
    inline = ["wrap install_tile ${var.slug} ${var.tile_version} ${var.glob} ${var.iaas} ${local.opman_product}"]
  }

  provisioner "remote-exec" {
    inline = ["wrap configure_tile ${local.opman_product}"]
  }

  connection {
    host        = var.provisioner_host
    user        = var.provisioner_username
    private_key = var.provisioner_private_key
  }
}