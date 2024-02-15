
# Define resource group information

resource "azurerm_resource_group" "aks_rg" {
  name     = var.rg_name
  location = var.location
}