resource "azurerm_public_ip" "public_ip" {
    for_each = var.public_ip
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

}