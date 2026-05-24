output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.this.id
}

output "databricks_workspace_url" {
  value = azurerm_databricks_workspace.this.workspace_url
}

output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}

output "job_identity_principal_id" {
  value = azurerm_user_assigned_identity.databricks_job_mi.principal_id
}

# Output: Client ID (used if Databricks needs to authenticate as this MI)
output "job_identity_client_id" {
  value = azurerm_user_assigned_identity.databricks_job_mi.client_id
}

# Output: Resource ID (used for role assignments)
output "job_identity_id" {
  value = azurerm_user_assigned_identity.databricks_job_mi.id
}

output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "postgres_admin_user_secret" {
  value = azurerm_key_vault_secret.postgres_admin_user.id
}

output "postgres_admin_password_secret" {
  value = azurerm_key_vault_secret.postgres_admin_password.id
}

output "postgres_database_name" {
  value = azurerm_postgresql_flexible_server_database.appdb.name
}

output "resource_group_name" {
  value = azurerm_resource_group.databricks_rg.name
}

output "location" {
  value = azurerm_resource_group.databricks_rg.location
}

output "storage_account_name" {
  value = azurerm_storage_account.adls.name
}

output "storage_account_id" {
  value = azurerm_storage_account.adls.id
}

output "raw_container_name" {
  value = azurerm_storage_container.raw.name
}

output "curated_container_name" {
  value = azurerm_storage_container.curated.name
}

output "semantic_container_name" {
  value = azurerm_storage_container.semantic.name
}