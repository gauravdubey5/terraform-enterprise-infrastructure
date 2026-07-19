resource_groups = {
  rg1 = {
    name                = "prod-rg"
    location            = "eastus"
    managed_by          = "terraform"
    tags                = "terraform"
  }

}

virtual_networks = {
  vnet1 = {
    name                = "prod-vnet1"
    location            = "eastus"
    resource_group_name = "prod-rg"
    address_space       = ["192.22.0.0/16"]
  
  }
  vnet2 = {
    name                = "prod-vnet2"
    location            = "eastus"
    resource_group_name = "prod-rg"
    address_space       = ["192.22.0.0/16"]
  
  }

}

subnets ={
    snt1 = {
        name = "frontend"
        resource_group_name = "prod-rg"
        virtual_network_name ="prod-vnet1"
        address_prefixes = ["192.22.0.0/24"]
    }

    snt1 = {
        name = "AzureBastionSubnet"
        resource_group_name = "prod-rg"
        virtual_network_name ="prod-vnet1"
        address_prefixes = ["192.22.1.0/24"]
    }
}

public_ip = {
    pip1 ={
          name                = "gauravpip"
  resource_group_name = "prod-rg"
  location            = "eastus"
  allocation_method   = "Static"
    }
}

Bastion = {
   bast1 = {
    name                = "gaurav"
    location            = "eastus"
    resource_group_name = "prod-rg"

    ip_configuration = {
      name                 = "configuration"
      subnet_id            = "/subscriptions/xxx/subnets/AzureBastionSubnet"
      public_ip_address_id = "/subscriptions/xxx/publicIP/gauravpip"
    }
  }

}