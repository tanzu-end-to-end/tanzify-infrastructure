
resource "null_resource" "configure_and_apply_director" {

  triggers = {
      id = null_resource.configure_authentication.id
  }

  depends_on = [null_resource.configure_authentication]

  // copy opsmanager config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/ops-manager.yml"
    destination = "~/config/ops-manager.yml"
  }

  // copy director config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/director.yml"
    destination = "~/config/director.yml"
  }

  // copy director ops file
  provisioner "file" {
    content     = "${file("${path.module}/configuration/${var.iaas}/director/pas.yml")}${file("${path.module}/configuration/${var.iaas}/director/pks.yml")}"
    destination = "~/config/director-config-ops.yml"
  }

  // copy director vars file that has the values
  provisioner "file" {
    content     = jsonencode(merge(jsondecode(var.opsman_configuration_values), var.map_extra_opsman_configuration_values))
    destination = "~/config/director-config-vars.yml"
  }

  provisioner "file" {
    content     = "${length(var.vm_extensions) > 0 ? join("\n|\n", var.vm_extensions) : " "}"
    destination = "~/vm_extensions.txt"
  }


  provisioner "remote-exec" {
    inline = ["wrap configure_director"]
  }

  provisioner "remote-exec" {
    when = "destroy"
    inline = ["wrap destroy_opsman ${self.triggers.id}"]
  }

  //  provisioner "remote-exec" {
//    inline = ["wrap post_install_opsman ${var.bosh_director_ip}"]
//  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}

