output "harbor_domain" {
  value = "${azurerm_dns_a_record.harbor-web.name}.${data.azurerm_dns_zone.hosted.name}"
}