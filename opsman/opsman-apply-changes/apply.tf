

resource "null_resource" "configure_tile" {

  provisioner "remote-exec" {
    inline = ["wrap apply_changes ${var.product-name}"]
  }


  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}
