output "harbor_domain" {
  value = "${azurerm_dns_a_record.harbor-web.name}.${data.azurerm_dns_zone.hosted.name}"
}

output "harbor_lb_security_group_name" {
  value = azurerm_network_security_group.harbor-network-security-group.name
}

output "harbor_lb_application_security_group_name" {
  value = azurerm_application_security_group.harbor-app-security-group.name
}

output "harbor_web_lb_name" {
  value = azurerm_lb.harbor-web-lb.name
}