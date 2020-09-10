resource "azurerm_public_ip" "harbor-web-public-ip" {
  name                    = "harbor-web-lb-public-ip"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Static"
  sku                     = "Standard"
  idle_timeout_in_minutes = 30

  tags = merge(
  var.tags,
  { name = "${var.environment_name}-harbor-web-lb-public-ip" },
  )
}

resource "azurerm_lb" "harbor-web-lb" {
  name                = "${var.environment_name}-harbor-web-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontendip"
    public_ip_address_id = azurerm_public_ip.harbor-web-public-ip.id
  }

  tags = merge(
  var.tags,
  { name = "${var.environment_name}-harbor-web-lb" },
  )
}

resource "azurerm_lb_backend_address_pool" "harbor-web-backend-pool" {
  name                = "${var.environment_name}-harbor-web-lb-backend-pool"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.harbor-web-lb.id
}

resource "azurerm_lb_probe" "harbor-web-https" {
  name                = "${var.environment_name}-harbor-web-lb-https-probe"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.harbor-web-lb.id
  protocol            = "TCP"
  port                = 443
}

resource "azurerm_lb_rule" "harbor-web-https" {
  name                = "${var.environment_name}-harbor-web-https-rule"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.harbor-web-lb.id

  frontend_ip_configuration_name = "frontendip"
  protocol                       = "TCP"
  frontend_port                  = 443
  backend_port                   = 443
  idle_timeout_in_minutes        = 30

  backend_address_pool_id = azurerm_lb_backend_address_pool.harbor-web-backend-pool.id
  probe_id                = azurerm_lb_probe.harbor-web-https.id
}

resource "azurerm_lb_probe" "web-http" {
  name                = "${var.environment_name}-web-http-probe"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.harbor-web-lb.id
  protocol            = "TCP"
  port                = 80
}

resource "azurerm_lb_rule" "web-http" {
  name                = "${var.environment_name}-web-http-rule"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.harbor-web-lb.id

  frontend_ip_configuration_name = "frontendip"
  protocol                       = "TCP"
  frontend_port                  = 80
  backend_port                   = 80
  idle_timeout_in_minutes        = 30

  backend_address_pool_id = azurerm_lb_backend_address_pool.harbor-web-backend-pool.id
  probe_id                = azurerm_lb_probe.web-http.id
}