
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
    content     = jsonencode(merge(jsondecode(var.tile_configuration_values), var.map_extratile_configuration))
    destination = "~/config/${var.tile_slug}-config-vars.yml"
  }
  // create the vm_extensions fileusing the yml config passed in.
  provisioner "file" {
    content      = var.vm_extensions_configuration_in_yml
    destination = "~/config/${var.tile_slug}-vm-extensions.yml"
  }

  // Apply the vm_extensions if any with the BOSH director. This is needed for some tiles like Harbor.
  provisioner "remote-exec" {
    inline = ["wrap create_vm_extensions ~/config/${var.tile_slug}-vm-extensions.yml"]
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
