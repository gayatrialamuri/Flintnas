resource "azurerm_resource_group" "databricks_rg" {
  name     = "rg-databricks-dev"
  location = "centralus"
}