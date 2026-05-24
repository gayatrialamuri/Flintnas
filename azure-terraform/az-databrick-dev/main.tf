resource "azurerm_resource_group" "databricks_rg" {
  name     = "rg-databricks-dev"
  location = "centralus"
}

# Databricks workspace
resource "azurerm_databricks_workspace" "this" {
  name                = "dbw-flintnas-dev"
  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location
  sku                 = "premium"
}

# Managed Identity for jobs
resource "azurerm_user_assigned_identity" "databricks_job_mi" {
  name                = "dbrx-job-mi"
  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location
}

# ADLS + Key Vault + Secret Scope module
module "data_platform" {
  source = "./modules/data-platform"

  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location

  storage_account_name = var.storage_account_name
  key_vault_name       = var.key_vault_name

  raw_container_name     = "raw"
  curated_container_name = "curated"

  databricks_workspace_url = azurerm_databricks_workspace.this.workspace_url

  secrets_reader_object_id = azurerm_user_assigned_identity.databricks_job_mi.principal_id
}