output "key_vault_id" {

  value = azurerm_key_vault.key_vaults.id

}

output "key_vault_name" {

  value = azurerm_key_vault.key_vaults.name

}

output "vault_uri" {

  value = azurerm_key_vault.key_vaults.vault_uri

}