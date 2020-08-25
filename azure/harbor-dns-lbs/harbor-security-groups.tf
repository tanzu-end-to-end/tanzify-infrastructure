
resource "azurerm_application_security_group" "harbor-app-security-group" {
  name                = "${var.environment_name}-harbor-app-sg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge(
  var.tags,
  { name = "${var.environment_name}-harbor-app-sg" },
  )
}

resource "azurerm_network_security_group" "harbor-network-security-group" {
  name                = "${var.environment_name}-harbor-network-sg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                                       = "api"
    priority                                   = 100
    direction                                  = "Inbound"
    access                                     = "Allow"
    protocol                                   = "Tcp"
    source_port_range                          = "*"
    destination_port_ranges                    = ["80", "443"]
    source_address_prefix                      = "*"
    destination_application_security_group_ids = [azurerm_application_security_group.harbor-app-security-group.id]
  }

  tags = merge(
  var.tags,
  { name = "${var.environment_name}-harbor-network-sg" },
  )
}