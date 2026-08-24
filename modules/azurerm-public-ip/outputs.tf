output "public_ip_id" {
  value = azurerm_public_ip.public_ips.id
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ips.ip_address
}

output "public_ip_name" {
  value = azurerm_public_ip.public_ips.name
}