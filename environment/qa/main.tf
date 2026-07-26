module "resource_groups" {
  source          = "../../modules/azurerm-resource-groups"
  resource_groups = var.resource_groups
}

module "virtual_networks" {
  depends_on = [module.resource_groups]

  source           = "../../modules/azurerm-virtual-networks"
  virtual_networks = var.virtual_networks
}

module "subnets" {
  depends_on = [module.virtual_networks]

  source  = "../../modules/azurerm-subnets"
  subnets = var.subnets
}

module "network_security_groups" {
  depends_on = [module.subnets]

  source                  = "../../modules/azurerm-network-security-groups"
  network_security_groups = var.network_security_groups
}

module "route_tables" {
  depends_on = [module.subnets]

  source       = "../../modules/azurerm-route-tables"
  route_tables = var.route_tables
}

module "public_ips" {
  depends_on = [module.resource_groups]

  source     = "../../modules/azurerm-public-ips"
  public_ips = var.public_ips
}

module "nat_gateways" {
  depends_on = [
    module.public_ips,
    module.subnets
  ]

  source       = "../../modules/azurerm-nat-gateways"
  nat_gateways = var.nat_gateways
}

module "bastions" {
  depends_on = [
    module.public_ips,
    module.subnets
  ]

  source    = "../../modules/azurerm-bastions"
  bastions  = var.bastions
}

module "load_balancers" {
  depends_on = [
    module.public_ips,
    module.virtual_machines
  ]

  source           = "../../modules/azurerm-load-balancers"
  load_balancers   = var.load_balancers
}

module "application_gateways" {
  depends_on = [
    module.public_ips,
    module.subnets
  ]

  source                 = "../../modules/azurerm-application-gateways"
  application_gateways   = var.application_gateways
}

module "storage_accounts" {
  depends_on = [module.resource_groups]

  source            = "../../modules/azurerm-storage-accounts"
  storage_accounts  = var.storage_accounts
}

module "key_vaults" {
  depends_on = [module.resource_groups]

  source      = "../../modules/azurerm-key-vaults"
  key_vaults  = var.key_vaults
}

module "managed_disks" {
  depends_on = [module.resource_groups]

  source         = "../../modules/azurerm-managed-disks"
  managed_disks  = var.managed_disks
}

module "virtual_machines" {
  depends_on = [
    module.subnets,
    module.public_ips,
    module.managed_disks
  ]

  source            = "../../modules/azurerm-virtual-machines"
  virtual_machines  = var.virtual_machines
}