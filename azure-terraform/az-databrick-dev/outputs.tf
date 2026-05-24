output "databricks_workspace_url" {
  value = module.infra.databricks_workspace_url
}

output "databricks_workspace_id" {
  value = module.infra.databricks_workspace_id
}

output "data_platform_storage_account" {
  value = module.data_platform.storage_account_name
}