resource "azurerm_storage_account" "adls" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.databricks_rg.name
  location                 = azurerm_resource_group.databricks_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  is_hns_enabled = true   # ADLS Gen2

  tags = {
    Environment = "dev"
    Owner       = "Gayatri"
  }
}

# -----------------------------
# Containers
# -----------------------------

resource "azurerm_storage_container" "raw" {
  name                  = "raw"
  storage_account_name  = azurerm_storage_account.adls.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "curated" {
  name                  = "curated"
  storage_account_name  = azurerm_storage_account.adls.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "semantic" {
  name                  = "semantic"
  storage_account_name  = azurerm_storage_account.adls.name
  container_access_type = "private"
}

# -----------------------------
# RBAC for Databricks Job Managed Identity
# -----------------------------

# Storage Blob Data Contributor → read/write to ADLS
resource "azurerm_role_assignment" "adls_rw" {
  scope                = azurerm_storage_account.adls.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.databricks_job_mi.principal_id
}

# Reader → allows metadata read
resource "azurerm_role_assignment" "adls_reader" {
  scope                = azurerm_storage_account.adls.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.databricks_job_mi.principal_id
}