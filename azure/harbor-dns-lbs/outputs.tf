output "harbor_domain" {
  value = "${azurerm_dns_a_record.harbor-web.name}.${data.azurerm_dns_zone.hosted.name}"
}

output "vm-extensions-yaml" {
  value = file("${path.module}/configuration/vm-extensions.yml")
}

