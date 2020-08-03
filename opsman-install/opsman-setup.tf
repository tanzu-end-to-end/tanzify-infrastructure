
locals {
  opsman_password = "${var.opsman_password == "" ? random_string.opsman_password.result : var.opsman_password}"
}

resource "random_string" "opsman_password" {
  length  = 8
  special = false
}

resource "null_resource" "setup_opsman" {

  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "file" {
    content     = var.ssl_cert
    destination = "/tmp/tempest.crt"
  }

  provisioner "file" {
    content     = var.ssl_private_key
    destination = "/tmp/tempest.key"
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

resource "null_resource" "cleanup_opsman" {

  provisioner "remote-exec" {
    when = "destroy"

    inline = ["wrap destroy_opsman"]
  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }

  depends_on = ["null_resource.setup_opsman"]
}