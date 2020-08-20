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

  depends_on = [null_resource.configure_and_apply_director]
}