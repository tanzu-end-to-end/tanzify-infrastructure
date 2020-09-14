
locals {
  product_name_string = join(" " , var.product-names)
}
resource "null_resource" "configure_tile" {

  provisioner "remote-exec" {
    inline = ["wrap apply_changes ${local.product_name_string}"]
  }


  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}
