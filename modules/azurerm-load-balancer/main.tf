resource "azurerm_lb" "lbs" {

  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {

    name                 = "frontend-ip"

    public_ip_address_id = var.public_ip_id

  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_address_pools" {

  name            = "backend-pool"

  loadbalancer_id = azurerm_lb.this.id

}

resource "azurerm_lb_probe" "lb_probes" {

  name            = "health-probe"

  loadbalancer_id = azurerm_lb.this.id

  protocol = "Tcp"

  port = 80

}

resource "azurerm_lb_rule" "lb_rules" {

  name = "http-rule"

  loadbalancer_id = azurerm_lb.this.id

  protocol = "Tcp"

  frontend_port = 80

  backend_port = 80

  frontend_ip_configuration_name = "frontend-ip"

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.this.id
  ]

  probe_id = azurerm_lb_probe.this.id

}