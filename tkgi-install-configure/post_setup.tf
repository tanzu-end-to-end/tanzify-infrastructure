
locals {
  cluster_domain_name_prefix = trimprefix(var.tkgi_api_dns_domain, "api.")
}
resource "random_string" "pks_password" {
  length  = 8
  special = false
}

data "template_file" "setup_tkgi" {
  template = "${chomp(file("${path.module}/scripts/setup_pks.sh"))}"

  vars = {
    api_endpoint = var.tkgi_api_dns_domain
    pks_password = random_string.pks_password.result
    pks_version  = var.tkgi_tile_version
    pks_username = var.tkgi_username
  }
}

data "template_file" "create_cluster" {
  template = "${chomp(file("${path.module}/scripts/create_cluster.sh"))}"

  vars = {
    cluster_name = var.cluster_name
    cluster_api_endpoint = "${var.cluster_name}.${local.cluster_domain_name_prefix}"
    plan = var.plan_name
  }
}

resource "null_resource" "setup_tkgi" {


  // copy config file
  provisioner "file" {
    content      = data.template_file.setup_tkgi.rendered
    destination = "~/setup_pks.sh"
  }


  provisioner "remote-exec" {
    inline = ["sudo chmod +x ~/setup_pks.sh"]
  }
  // copy config file
  provisioner "file" {
    content      = data.template_file.create_cluster.rendered
    destination = "~/create_cluster.sh"
  }


  provisioner "remote-exec" {
    inline = ["sudo chmod +x ~/create_cluster.sh"]
  }

  provisioner "remote-exec" {
    inline = ["sudo rm -f .uaac.yml"]
  }
  provisioner "remote-exec" {
    inline = ["wrap bash ~/setup_pks.sh"]
  }

  provisioner "remote-exec" {
    inline = ["wrap bash ~/create_cluster.sh"]
  }


  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}