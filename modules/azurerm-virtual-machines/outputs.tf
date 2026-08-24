output "virtual_machine_id" {

  value = azurerm_linux_virtual_machine.virtual_machines.id

}

output "virtual_machine_name" {

  value = azurerm_linux_virtual_machine.virtual_machines.name

}

output "private_ip" {

  value = azurerm_network_interface.nics.private_ip_address

}