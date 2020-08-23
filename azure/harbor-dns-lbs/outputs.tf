output "harbor_domain" {
  value = "${azurerm_dns_a_record.harbor-web}.${data.azurerm_dns_zone.hosted.name}"
}