output "harbor_domain" {
  value = "${azurerm_dns_a_record.harbor-web.name}.${data.azurerm_dns_zone.hosted.name}"
}

output "vm-extensions-yaml" {
  value = data.template_file.vm_extension_configuration.rendered
}

