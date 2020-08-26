// put the values in here.
data "template_file" "vm_extension_configuration" {
  template = "${chomp(file("${path.module}/configuration/vm-extensions.yml"))}"

  vars = {
    environment_name  = var.environment_name
  }
}