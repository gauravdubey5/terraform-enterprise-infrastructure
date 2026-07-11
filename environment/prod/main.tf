module "resource_group"{
    source = "../../modules/azurerm-resource-groups"
    resource_group = var.resource_group
}

module "virtual_networks"{
    depends_on = [modul.resource_group]
    source = "../../modules/azurerm-virtual-networks"
    virtual_networks = var.virtual_networks
}
module "subnets"{
    depends_on = [modul.virtual_networks]
    source = "../../modules/azurerm-subnets"
    subnets = var.subnets
}

module "public_ip"{
    depends_on = [modul.resource_group]
    source = "../../modules/azurerm-public-ip"
    public_ip = var.public_ip
}

module "Bastion"{
    depends_on = [modul.subnets]
    source = "../../modules/azurerm-bastion"
    Bastion = var.Bastion
}
