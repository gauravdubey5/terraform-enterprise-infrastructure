variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "subnets" {

  description = "Subnet Configuration"

  type = map(object({

    name = string

    address_prefixes = list(string)

  }))
}