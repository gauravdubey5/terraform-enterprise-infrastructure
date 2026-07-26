variable "disk_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "disk_size_gb" {

  type = number

  default = 128

}

variable "storage_account_type" {

  type = string

  default = "Premium_LRS"

}

variable "tags" {

  type = map(string)

  default = {

    ManagedBy = "Terraform"

  }

}