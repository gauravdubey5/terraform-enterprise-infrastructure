output "resource_group_name" {
  value = azurerm_resource_group.resource_groups.name
}

output "resource_group_id" {
  value = azurerm_resource_group.resource_groups.id
}

output "location" {
  value = azurerm_resource_group.resource_groups.location
}