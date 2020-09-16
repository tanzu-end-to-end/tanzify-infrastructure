
locals {
  product_name_args = length(var.product-names) > 0 ? join(" --product-name " , var.product-names) : ""
}
resource "null_resource" "configure_tile" {

  provisioner "remote-exec" {
    inline = ["wrap apply_changes ${local.product_name_args}"]
  }


  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}
