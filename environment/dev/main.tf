module "resource_groups"{
    source = "../../modules/azurerm-resource-groups"
    resource_groups = var.resource_groups
}

module "virtual_networks"{
    depends_on = [module.resource_groups]
    source = "../../modules/azurerm-virtual-networks"
    virtual_networks = var.virtual_networks
}
module "subnets"{
    depends_on = [module.virtual_networks]
    source = "../../modules/azurerm-subnets"
    subnets = var.subnets
}

module "public_ip"{
    depends_on = [module.resource_groups]
    source = "../../modules/azurerm-public-ip"
    public_ip = var.public_ip
}

module "virtual_machines"{
    depends_on = [module.subnets, module.public_ip]
    source = "../../modules/azurerm-virtual-machines"
    virtual_machines = var.virtual_machines
}

# module "Bastion"{
#     depends_on = [module.subnets]
#     source = "../../modules/azurerm-bastion"
#     Bastion = var.Bastion
# }
