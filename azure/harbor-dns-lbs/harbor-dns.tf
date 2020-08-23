
data "azurerm_dns_zone" "hosted" {
  name = var.hosted_zone
}

resource "azurerm_dns_a_record" "harbor-web" {
  name                = "harbor.${var.environment_name}"
  zone_name           = data.azurerm_dns_zone.hosted.name
  resource_group_name = data.azurerm_dns_zone.hosted.resource_group_name
  ttl                 = "60"
  records             = [azurerm_public_ip.harbor-web-public-ip.ip_address]

  tags = merge(
  var.tags,
  { name = "harbor.${var.environment_name}" },
  )
}