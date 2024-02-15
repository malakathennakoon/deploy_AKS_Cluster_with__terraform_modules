# Create log analytics workspace

resource "azurerm_log_analytics_workspace" "insights" {
  name                = "logs-${random_pet.aksrandom.id}"
  location            = var.location
  resource_group_name = module.resource_group.rg_name_out
  sku                 = "PerGB2018"
  retention_in_days   = 30
}