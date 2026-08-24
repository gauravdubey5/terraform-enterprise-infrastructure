output "bastion_id" {
  value = azurerm_bastion_host.bastion_hosts.id
}

output "bastion_name" {
  value = azurerm_bastion_host.bastion_hosts.name
}