variable "resource_groups" {
  type        = map(any)
  description = "Comma Separated RG Names"
}

variable "virtual_networks" {
  type        = map(any)
  description = "Comma Separated Vnets"
}

variable "subnets" {
  type        = map(any)
  description = "Comma Separated Vnets"
}

variable "public_ip" {
  type        = map(any)
  description = "Comma Separated Vnets"
}

variable "Bastion" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = string
    })
  }))
}