#############################################
# Resource Groups
#############################################

resource_groups = {
  rg1 = {
    name       = "gaurav-prod-rg"
    location   = "Central India"
    managed_by = "Terraform"
  }
}

#############################################
# Virtual Networks
#############################################

virtual_networks = {
  vnet1 = {
    name                = "gaurav-prod-vnet"
    location            = "Central India"
    resource_group_name = "gaurav-prod-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

#############################################
# Subnets
#############################################

subnets = {

  frontend = {
    name                 = "frontend"
    resource_group_name  = "gaurav-prod-rg"
    virtual_network_name = "gaurav-prod-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  backend = {
    name                 = "backend"
    resource_group_name  = "gaurav-prod-rg"
    virtual_network_name = "gaurav-prod-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

  bastion = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "gaurav-prod-rg"
    virtual_network_name = "gaurav-prod-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }

}

#############################################
# Network Security Groups
#############################################

network_security_groups = {

  web = {

    name                = "frontend-nsg"
    location            = "Central India"
    resource_group_name = "gaurav-prod-rg"

    security_rules = {

      AllowSSH = {
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      AllowHTTP = {
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

    }

  }

}

#############################################
# Route Tables
#############################################

route_tables = {

  rt1 = {

    name                = "gaurav-prod-rt"
    location            = "Central India"
    resource_group_name = "gaurav-prod-rg"

    routes = {

      internet = {

        address_prefix         = "0.0.0.0/0"
        next_hop_type          = "Internet"
        next_hop_in_ip_address = null

      }

    }

  }

}

#############################################
# Public IPs
#############################################

public_ips = {

  frontend = {
    name                = "frontend-pip"
    resource_group_name = "gaurav-prod-rg"
    location            = "Central India"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  bastion = {
    name                = "bastion-pip"
    resource_group_name = "gaurav-prod-rg"
    location            = "Central India"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

}

#############################################
# NAT Gateway
#############################################

nat_gateways = {

  nat1 = {

    name                 = "gaurav-prod-nat"
    location             = "Central India"
    resource_group_name  = "gaurav-prod-rg"
    public_ip_name       = "frontend-pip"
    subnet_name          = "frontend"
    virtual_network_name = "gaurav-prod-vnet"

  }

}

#############################################
# Bastion
#############################################

bastions = {

  bastion1 = {

    name                 = "gaurav-prod-bastion"
    location             = "Central India"
    resource_group_name  = "gaurav-prod-rg"
    public_ip_name       = "bastion-pip"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "gaurav-prod-vnet"

  }

}

#############################################
# Load Balancer
#############################################

load_balancers = {

  lb1 = {

    name                = "gaurav-prod-lb"
    location            = "Central India"
    resource_group_name = "gaurav-prod-rg"
    public_ip_name      = "frontend-pip"

  }

}

#############################################
# Application Gateway
#############################################

application_gateways = {

  appgw1 = {

    name                 = "gaurav-prod-appgw"
    location             = "Central India"
    resource_group_name  = "gaurav-prod-rg"
    subnet_name          = "frontend"
    virtual_network_name = "gaurav-prod-vnet"
    public_ip_name       = "frontend-pip"

  }

}

#############################################
# Storage Accounts
#############################################

storage_accounts = {

  sa1 = {

    name                = "gaurav-prodstorage001"
    location            = "Central India"
    resource_group_name = "gaurav-prod-rg"

    account_tier     = "Standard"
    replication_type = "LRS"

  }

}

#############################################
# Key Vaults
#############################################

key_vaults = {

  kv1 = {

    name                = "gaurav-prod-kv-001"
    location            = "Central India"
    resource_group_name = "gaurav-prod-rg"

  }

}

#############################################
# Managed Disks
#############################################

managed_disks = {

  disk1 = {

    name                 = "vm-disk-01"
    location             = "Central India"
    resource_group_name  = "gaurav-prod-rg"
    disk_size_gb         = 128
    storage_account_type = "Premium_LRS"

  }

}

#############################################
# Virtual Machines
#############################################

virtual_machines = {

  vm1 = {

    nic_name        = "frontend-nic"
    location        = "Central India"
    rg_name         = "gaurav-prod-rg"
    nic_subnet_name = "frontend"
    nic_vnet_name   = "gaurav-prod-vnet"
    nic_pip_name    = "frontend-pip"

    vm_name        = "frontend-vm"
    vm_size        = "Standard_B2s"
    admin_username = "azureuser"
    admin_password = "Devops@123"

    ip_nic_name = "frontend-ipconfig"

  }

}