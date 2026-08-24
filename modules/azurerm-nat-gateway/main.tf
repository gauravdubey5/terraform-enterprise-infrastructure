resource "azurerm_nat_gateway" "nat_gateways" {

  name                = var.nat_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "Standard"

  idle_timeout_in_minutes = var.idle_timeout

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "public_ip_associations" {

  nat_gateway_id       = azurerm_nat_gateway.nat_gateways.id
  public_ip_address_id = var.public_ip_id

}

resource "azurerm_subnet_nat_gateway_association" "subnet_associations" {

  subnet_id      = var.subnet_id
  nat_gateway_id = azurerm_nat_gateway.nat_gateways.id

}