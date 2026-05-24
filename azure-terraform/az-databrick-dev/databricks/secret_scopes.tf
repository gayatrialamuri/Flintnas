resource "databricks_secret_scope" "kv_scope" {
  name = "kv-secrets"

  keyvault_metadata {
    resource_id = var.key_vault_id
    dns_name    = var.key_vault_uri
  }
}