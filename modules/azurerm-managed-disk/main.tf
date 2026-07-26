resource "azurerm_managed_disk" "managed_disks" {

  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name

  storage_account_type = var.storage_account_type

  create_option = "Empty"

  disk_size_gb = var.disk_size_gb

  tags = var.tags
}