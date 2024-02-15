# Create a Subnet for AKS
resource "azurerm_subnet" "aks-default" {
  for_each = var.subnets
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = each.value["address_prefixes"]
  name                 = each.value["name"]
}