
locals {
  opman_product = var.om_product == "" ? var.tkgi_slug : var.om_product
}


resource "null_resource" "configure_tkgi" {

  // copy config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/pks.yml"
    destination = "~/config/pks.yml"
  }

  // copy ops file with values
  provisioner "file" {
    content     = var.tkgi_configuration_values
    destination = "~/config/pks-config-vars.yml"
  }

  provisioner "remote-exec" {
    inline = ["wrap install_tile ${var.tkgi_slug} ${var.tkgi_tile_version} ${var.glob} ${var.iaas} ${local.opman_product}"]
  }

  provisioner "remote-exec" {
    inline = ["wrap configure_tile_with_vars ~/config/pks.yml ~/config/pks-config-vars.yml"]
  }

  provisioner "remote-exec" {
    inline = ["wrap apply_changes pivotal-container-service"]
  }

//  provisioner "remote-exec" {
//    inline = ["wrap post_install_opsman ${var.bosh_director_ip}"]
//  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}
