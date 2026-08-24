output "storage_account_id" {

  value = azurerm_storage_account.storage_accounts.id

}

output "storage_account_name" {

  value = azurerm_storage_account.storage_accounts.name

}

output "primary_blob_endpoint" {

  value = azurerm_storage_account.storage_accounts.primary_blob_endpoint

}