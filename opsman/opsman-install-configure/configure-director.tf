
resource "null_resource" "configure_and_apply_director" {


  depends_on = [null_resource.configure_authentication]

  // copy opsmanager config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/ops-manager.yml"
    destination = "~/config/ops-manager.yml"
    connection = null_resource.configure_authentication.connection
  }

  // copy director config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/director.yml"
    destination = "~/config/director.yml"
    connection = null_resource.configure_authentication.connection
  }

  // copy director ops file
  provisioner "file" {
    content     = "${file("${path.module}/configuration/${var.iaas}/director/pas.yml")}${file("${path.module}/configuration/${var.iaas}/director/pks.yml")}"
    destination = "~/config/director-config-ops.yml"
    connection = null_resource.configure_authentication.connection
  }

  // copy director vars file that has the values
  provisioner "file" {
    content     = jsonencode(merge(jsondecode(var.opsman_configuration_values), var.map_extra_opsman_configuration_values))
    destination = "~/config/director-config-vars.yml"
    connection = null_resource.configure_authentication.connection
  }

  provisioner "file" {
    content     = length(var.vm_extensions) > 0 ? join("\n|\n", var.vm_extensions) : " "
    destination = "~/vm_extensions.txt"
    connection = null_resource.configure_authentication.connection
  }


  provisioner "remote-exec" {
    inline = ["wrap configure_director"]
    connection = null_resource.configure_authentication.connection
  }

  provisioner "remote-exec" {
    when = destroy
    inline = ["wrap destroy_opsman"]
    connection = self.connection
  }

  //  provisioner "remote-exec" {
//    inline = ["wrap post_install_opsman ${var.bosh_director_ip}"]
//  }

}

