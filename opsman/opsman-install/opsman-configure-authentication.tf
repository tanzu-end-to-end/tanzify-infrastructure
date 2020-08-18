

resource "null_resource" "configure_authentication" {

  depends_on = [null_resource.install_ssl_certs]

  provisioner "local-exec" {
    command = "sleep 30"
  }

  provisioner "remote-exec" {
    inline = ["wrap configure_authentication"]
  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}

