data "azurerm_client_config" "current" {}

terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.50"
    }
  }
}

# -----------------------------
# ADLS Gen2 Storage Account
# -----------------------------
resource "azurerm_storage_account" "adls" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  is_hns_enabled = true

  tags = var.tags
}

resource "azurerm_storage_container" "raw" {
  name                  = var.raw_container_name
  storage_account_id    = azurerm_storage_account.adls.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "curated" {
  name                  = var.curated_container_name
  storage_account_id    = azurerm_storage_account.adls.id
  container_access_type = "private"
}

resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  # AzureRM v4.x requires this instead of soft_delete_enabled
  soft_delete_retention_days = 7

  # purge_protection_enabled is still valid
  purge_protection_enabled = false

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "secrets_reader" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.secrets_reader_object_id

  secret_permissions = [
    "Get",
    "List",
  ]
}

# -----------------------------
# Databricks Secret Scope (Key Vault–backed)
# -----------------------------
resource "databricks_secret_scope" "kv_scope" {
  name = "kv-scope"

  keyvault_metadata {
    resource_id    = azurerm_key_vault.kv.id
    dns_name       = azurerm_key_vault.kv.vault_uri
    user_aad_token = true
  }
}