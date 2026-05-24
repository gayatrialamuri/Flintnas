resource "azurerm_user_assigned_identity" "databricks_job_mi" {
  name                = "dbrx-job-mi"
  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location

  tags = {
    Environment = "dev"
    Owner       = "newsun"
  }
}