resource "azurerm_databricks_workspace" "this" {
  name                = "dbw-training-dev"
  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location
  sku                 = "premium"

  tags = {
    Environment = "dev"
    Owner       = "newsun"
  }
}
