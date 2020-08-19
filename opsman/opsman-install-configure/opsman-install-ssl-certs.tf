

resource "null_resource" "install_ssl_certs" {

  provisioner "local-exec" {
    command = "sleep 30"
  }


  provisioner "file" {
    content     = var.ssl_cert
    destination = "/tmp/tempest.crt"
  }

  provisioner "file" {
    content     = var.ssl_private_key
    destination = "/tmp/tempest.key"
  }

  provisioner "remote-exec" {
    inline = ["wrap install_ssl_certs"]
  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}

