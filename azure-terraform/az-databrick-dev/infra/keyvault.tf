resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  rbac_authorization_enabled = false

  tags = {
    Environment = "dev"
    Owner       = "newsun"
  }
}

# ---------------------------------------------------------
# Access Policy: Databricks Job Managed Identity
# Allows Databricks jobs to read secrets
# ---------------------------------------------------------
resource "azurerm_key_vault_access_policy" "job_mi_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.databricks_job_mi.principal_id

  secret_permissions = [
    "Get",
    "List"
  ]
}

# ---------------------------------------------------------
# Access Policy: Terraform SPN
# Allows Terraform to create/manage secrets
# ---------------------------------------------------------
resource "azurerm_key_vault_access_policy" "terraform_spn_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.terraform_spn_object_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge",
    "Recover"
  ]
}