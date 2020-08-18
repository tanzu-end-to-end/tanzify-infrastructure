
locals {
  opsman_password = var.opsman_password == "" ? random_string.opsman_password.result : var.opsman_password
}

resource "random_string" "opsman_password" {
  length  = 12
  special = false
}

resource "null_resource" "setup_opsman" {

  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "file" {
    source      = "${path.module}/scripts/"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = ["chmod +x /tmp/setup_opsman.sh && /tmp/setup_opsman.sh ${var.pivnet_token} ${var.ops_manager_dns} ${local.opsman_password}"]
  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}


