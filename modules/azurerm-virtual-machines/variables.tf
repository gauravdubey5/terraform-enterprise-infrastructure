variable "vm_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_size" {

  type = string

  default = "Standard_B2s"

}

variable "admin_username" {

  type = string

  default = "azureuser"

}

variable "public_key" {
  type = string
}

variable "tags" {

  type = map(string)

  default = {

    ManagedBy = "Terraform"

  }

}