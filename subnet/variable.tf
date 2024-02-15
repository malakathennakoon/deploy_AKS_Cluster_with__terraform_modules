variable "vnet_name" {
    type = string
    description = "Virtual network name"
}

variable "location" {
    type = string
    description = "subnet location"
}

variable "resource_group_name" {
    type = string
    description = "resource group location"
}

/*
variable "vnet_name" {
  type = string
  description = "vnet name for subnets"
} */

variable "subnets" {
    type = map(any)
    default = {
      subnet_1 = {
        name             = "subnet_1"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet_2 = {
        name             = "subnet_2"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
}

  
