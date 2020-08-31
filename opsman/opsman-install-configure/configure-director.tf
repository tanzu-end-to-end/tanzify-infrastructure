
resource "null_resource" "configure_and_apply_director" {

  depends_on = [null_resource.configure_authentication]

  // copy config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/director.yml"
    destination = "~/config/director.yml"
  }

  // copy config file
  provisioner "file" {
    source      = "${path.module}/configuration/${var.iaas}/ops-manager.yml"
    destination = "~/config/ops-manager.yml"
  }

  // copy ops file with values
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


  //  provisioner "remote-exec" {
//    inline = ["wrap post_install_opsman ${var.bosh_director_ip}"]
//  }

  connection {
    host        = "${var.ops_manager_dns}"
    user        = "ubuntu"
    private_key = "${var.ops_manager_ssh_private_key }"
  }
}

resource "null_resource" "cleanup_opsman" {

  provisioner "remote-exec" {
    when = "destroy"

    inline = ["wrap destroy_opsman"]
  }

  connection {
    host        = "${var.ops_manager_dns}"
    user        = "ubuntu"
    private_key = "${var.ops_manager_ssh_private_key }"
  }

  depends_on = ["null_resource.configure_and_apply_director"]
}