resource "null_resource" "destroy_opsman" {

  triggers = {
    id = null_resource.configure_and_apply_director.id
  }


  provisioner "remote-exec" {
    when = "destroy"
    inline = ["wrap destroy_opsman ${self.triggers.id}"] // use self reference here for destroy as terraform 0.12.8 requires it. See https://discuss.hashicorp.com/t/how-to-rewrite-null-resource-with-local-exec-provisioner-when-destroy-to-prepare-for-deprecation-after-0-12-8/4580
  }

  connection {
    host        = var.ops_manager_dns
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }
}