output "storage_account_name" {
  value = azurerm_storage_account.adls.name
}

output "raw_container_name" {
  value = azurerm_storage_container.raw.name
}

output "curated_container_name" {
  value = azurerm_storage_container.curated.name
}

output "key_vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}

output "secret_scope_name" {
  value = databricks_secret_scope.kv_scope.name
}