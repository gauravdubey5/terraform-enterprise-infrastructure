resource "azurerm_network_interface" "nics" {

  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {

    name                          = "internal"

    subnet_id                     = var.subnet_id

    private_ip_address_allocation = "Dynamic"

  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "virtual_machines" {

  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  size = var.vm_size

  admin_username = var.admin_username

  disable_password_authentication = true

  admin_ssh_key {

    username = var.admin_username

    public_key = var.public_key

  }

  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Premium_LRS"

  }

  source_image_reference {

    publisher = "Canonical"

    offer = "0001-com-ubuntu-server-jammy"

    sku = "22_04-lts"

    version = "latest"

  }

  tags = var.tags
}