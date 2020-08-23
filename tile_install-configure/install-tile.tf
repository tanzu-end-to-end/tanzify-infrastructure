
locals {
  opman_product = var.om_product == "" ? var.tile_slug : var.om_product
}

resource "null_resource" "configure_tile" {

  // copy config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/${var.tile_slug}_config.yml"
    destination = "~/config/${var.tile_slug}-config.yml"
  }

  // copy ops file with values
  provisioner "file" {
    content     = jsonencode(merge(jsondecode(var.tile_configuration_values), var.hosted_zone))
    destination = "~/config/${var.tile_slug}-config-vars.yml"
  }


  provisioner "remote-exec" {
    inline = ["wrap install_tile ${var.tile_slug} ${var.tile_version} ${var.glob} ${var.iaas} ${local.opman_product}"]
  }

  provisioner "remote-exec" {
    inline = ["wrap configure_tile_with_vars ~/config/${var.tile_slug}-config.yml ~/config/${var.tile_slug}-config-vars.yml"]
  }


  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}
