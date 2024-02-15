terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "~>2.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~>3.0"
    }
  }

/*
  backend "azurerm" {
    resource_group_name  = "acr-rg1"
    storage_account_name = "faksstoragerg"
    container_name       = "fstatefiles"
    key                  = "terraform_con_vnet.tfstate"
  } */

}

provider "azurerm" {
  skip_provider_registration = true
  features {
    virtual_machine {
      delete_os_disk_on_deletion = true
    }
    resource_group {
     prevent_deletion_if_contains_resources = false  
    }
  }
}

resource "random_pet" "aksrandom" {
  
  }

module "resource_group" {
  source    = "./resourceGroup"
  rg_name   = "${var.resource_group_name}-${var.environment}"
  location  = var.location
}

module "virtual_network" {
  source              = "./vnet"
  vnet_name           = "aks-vnet"
  location            = var.location
  resource_group_name = module.resource_group.rg_name_out
}

module "subnet" {
  source              = "./subnet"
  location            = var.location
  resource_group_name = module.resource_group.rg_name_out
  vnet_name           = module.virtual_network.vnet_out
}

