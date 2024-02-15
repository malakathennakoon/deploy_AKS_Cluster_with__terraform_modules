output "azure_subnet_id" {
  value = azurerm_subnet.aks-default["subnet_1"].id
  description = "List of ID's of the subnets"
}

