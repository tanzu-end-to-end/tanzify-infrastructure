
data "template_file" "pks_config" {
  template = chomp(file("${path.module}/config/pks.yml"))
  vars = {
    ssl_certificate = "${var.ssl_certificate}"
    ssl_private_key = "${var.ssl_private_key}"

  }
}

/*
resource "random_string" "pks_password" {
  length  = 8
  special = false
}

data "template_file" "pks_script_setup" {
  template = chomp(file("${path.module}/templates/setup_pks.sh"))

  vars = {
    api_endpoint = var.api_domain
    pks_password = random_string.pks_password.result
    pks_version  = local.tile_versions["pks"]
  }
}

resource "null_resource" "setup_pks" {
  depends_on = ["null_resource.setup_opsman"]

  provisioner "file" {
    content     = data.template_file.pks_config.rendered
    destination = "~/config/cf-config.yml"
  }

  provisioner "file" {
    content     = file("${path.module}/config/setup_pks.sh")
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = ["wrap configure_tile cf"]
  }

  connection {
    host        = "${var.opsman_host}"
    user        = "ubuntu"
    private_key = "${var.opsman_ssh_key}"
  }
}
*/


