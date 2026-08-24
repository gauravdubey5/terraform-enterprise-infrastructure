output "vnet_name" {
  value = azurerm_virtual_network.virtual_networks.name
}

output "vnet_id" {
  value = azurerm_virtual_network.virtual_networks.id
}

output "address_space" {
  value = azurerm_virtual_network.virtual_networks.address_space
}