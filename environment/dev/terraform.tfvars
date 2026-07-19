resource_groups = {
  rg1 = {
    name                = "dev-rg"
    location            = "centralindia"
    managed_by          = "terraform"
  }

}

virtual_networks = {
  vnet1 = {
    name                = "dev-vnet1"
    location            = "centralindia"
    resource_group_name = "dev-rg"
    address_space       = ["192.22.0.0/16"]
  
  }
  vnet2 = {
    name                = "dev-vnet2"
    location            = "centralindia"
    resource_group_name = "dev-rg"
    address_space       = ["192.22.0.0/16"]
  
  }

}

subnets ={
    snt1 = {
        name = "frontend"
        resource_group_name = "dev-rg"
        virtual_network_name ="dev-vnet1"
        address_prefixes = ["192.22.0.0/24"]
    }

    snt1 = {
        name = "AzureBastionSubnet"
        resource_group_name = "dev-rg"
        virtual_network_name ="dev-vnet1"
        address_prefixes = ["192.22.1.0/24"]
    }
}

public_ip = {
    pip1 ={
  name                = "nic_pip"
  resource_group_name = "dev-rg"
  location            = "centralindia"
  allocation_method   = "Static"
    }
    pip2 ={
  name                = "nic_pip1"
  resource_group_name = "dev-rg"
  location            = "centralindia"
  allocation_method   = "Static"
    }
}

virtual_machines = {
  vm1 = {
    nic_name        = "frontend-vm-nic"
    location        = "centralindia"
    rg_name         = "dev-rg"
    nic_subnet_name = "frontend"
    nic_vnet_name   = "dev-vnet1"
    nic_pip_name    = "nic_pip"
    vm_name         = "frontend-vm"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    admin_password  = "DevOps@123"
  }
  vm2 = {
    nic_name        = "backend-vm-nic"
    location        = "centralindia"
    rg_name         = "dev-rg"
    nic_subnet_name = "frontend"
    nic_vnet_name   = "dev-vnet1"
    nic_pip_name    = "nic_pip1"
    vm_name         = "backend-vm"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    admin_password  = "DevOps@123"
  }
}

# Bastion = {
#    bast1 = {
#     name                = "gaurav"
#     location            = "centralindia"
#     resource_group_name = "dev-rg"

#     ip_configuration = {
#       name                 = "configuration"
#       subnet_id            = "/subscriptions/xxx/subnets/AzureBastionSubnet"
#       public_ip_address_id = "/subscriptions/xxx/publicIP/gauravpip"
#     }
#   }

# }