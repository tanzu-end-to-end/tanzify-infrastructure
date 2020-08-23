resource "random_string" "pks_password" {
  length  = 8
  special = false
}

data "template_file" "setup_pks" {
  template = "${chomp(file("${path.module}/scripts/setup_pks.sh"))}"

  vars = {
    api_endpoint = "pks.novant-demo.azure.pcf-arau.pw"
    pks_password = random_string.pks_password.result
    pks_version  = var.tkgi_tile_version
  }
}

resource "null_resource" "configure_tkgi" {

  // copy config file
  provisioner "file" {
    source      = "${path.module}/scripts/setup_pks.sh"
    destination = "~/setup_pks.sh"
  }


  provisioner "remote-exec" {
    inline = ["chmod +x ~/setup_pks.sh"]
  }

  provisioner "remote-exec" {
    inline = ["wrap bash ~/setup_pks.sh"]
  }


  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}