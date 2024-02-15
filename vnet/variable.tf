variable "vnet_name" {
    type = string
    description = "Virtual network name"
}

variable "location" {
    type = string
    description = "Vnet location"
}

variable "resource_group_name" {
    type = string
    description = "resource group location"
}

variable "address_prefixes" {
  type = list(any)
  description = "vnet address space"
  default = [ "10.0.0.8/8" ]
}