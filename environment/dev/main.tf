module "resource_groups" {
  for_each = var.resource_groups
  source   = "../../modules/azurerm-resource-groups"

  resource_group_name = each.value.name
  location            = each.value.location
}

module "virtual_networks" {
  depends_on = [module.resource_groups]
  for_each   = var.virtual_networks

  source              = "../../modules/azurerm-virtual-networks"
  vnet_name           = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}

module "subnets" {
  depends_on = [module.virtual_networks]
  for_each   = var.subnets

  source               = "../../modules/azurerm-subnets"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  subnets              = { (each.key) = { name = each.value.name, address_prefixes = each.value.address_prefixes } }
}

module "network_security_groups" {
  depends_on = [module.subnets]
  for_each   = var.network_security_groups

  source              = "../../modules/azurerm-network-security-group"
  nsg_name            = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  security_rules      = each.value.security_rules
}

module "route_tables" {
  depends_on = [module.subnets]
  for_each   = var.route_tables

  source              = "../../modules/azurerm-route-table"
  route_table_name    = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  routes              = each.value.routes
}

module "public_ips" {
  depends_on = [module.resource_groups]
  for_each   = var.public_ips

  source              = "../../modules/azurerm-public-ip"
  public_ip_name      = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

module "nat_gateways" {
  depends_on = [
    module.public_ips,
    module.subnets
  ]
  for_each = var.nat_gateways

  source              = "../../modules/azurerm-nat-gateway"
  nat_gateway_name    = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  public_ip_id        = one([for key, public_ip in var.public_ips : module.public_ips[key].public_ip_id if public_ip.name == each.value.public_ip_name])
  subnet_id           = one([for key, subnet in var.subnets : module.subnets[key].subnet_ids[subnet.name] if subnet.name == each.value.subnet_name])
}

module "bastions" {
  depends_on = [
    module.public_ips,
    module.subnets
  ]
  for_each = var.bastions

  source              = "../../modules/azurerm-bastion"
  bastion_name        = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  public_ip_id        = one([for key, public_ip in var.public_ips : module.public_ips[key].public_ip_id if public_ip.name == each.value.public_ip_name])
  subnet_id           = one([for key, subnet in var.subnets : module.subnets[key].subnet_ids[subnet.name] if subnet.name == each.value.subnet_name])
}

module "load_balancers" {
  depends_on = [
    module.public_ips,
    module.virtual_machines
  ]
  for_each = var.load_balancers

  source              = "../../modules/azurerm-load-balancer"
  lb_name             = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  public_ip_id        = one([for key, public_ip in var.public_ips : module.public_ips[key].public_ip_id if public_ip.name == each.value.public_ip_name])
}

module "application_gateways" {
  depends_on = [
    module.public_ips,
    module.subnets
  ]
  for_each = var.application_gateways

  source                   = "../../modules/azurerm-application-gateway"
  application_gateway_name = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  public_ip_id             = one([for key, public_ip in var.public_ips : module.public_ips[key].public_ip_id if public_ip.name == each.value.public_ip_name])
  subnet_id                = one([for key, subnet in var.subnets : module.subnets[key].subnet_ids[subnet.name] if subnet.name == each.value.subnet_name])
}

module "storage_accounts" {
  depends_on = [module.resource_groups]
  for_each   = var.storage_accounts

  source               = "../../modules/azurerm-storage-account"
  storage_account_name = each.value.name
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  account_tier         = each.value.account_tier
  replication_type     = each.value.replication_type
}

module "key_vaults" {
  depends_on = [module.resource_groups]
  for_each   = var.key_vaults

  source              = "../../modules/azurerm-key-vault"
  key_vault_name      = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

module "managed_disks" {
  depends_on = [module.resource_groups]
  for_each   = var.managed_disks

  source               = "../../modules/azurerm-managed-disk"
  disk_name            = each.value.name
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  disk_size_gb         = each.value.disk_size_gb
  storage_account_type = each.value.storage_account_type
}

module "virtual_machines" {
  depends_on = [
    module.subnets,
    module.public_ips,
    module.managed_disks
  ]
  for_each = var.virtual_machines

  source              = "../../modules/azurerm-virtual-machines"
  vm_name             = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  subnet_id           = one([for key, subnet in var.subnets : module.subnets[key].subnet_ids[subnet.name] if subnet.name == each.value.nic_subnet_name])
  vm_size             = each.value.vm_size
  admin_username      = each.value.admin_username
  public_key          = each.value.public_key
}