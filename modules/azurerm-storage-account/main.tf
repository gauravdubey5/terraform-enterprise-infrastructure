resource "azurerm_storage_account" "storage_accounts" {

  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location

  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  min_tls_version          = "TLS1_2"

  allow_nested_items_to_be_public = false

  tags = var.tags
}