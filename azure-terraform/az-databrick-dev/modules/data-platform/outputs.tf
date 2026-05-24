output "storage_account_name" {
  value = data.azurerm_storage_account.adls.name
}
output "storage_account_id" {
  value = data.azurerm_storage_account.adls.id
}
output "raw_container_name" {
  value = var.raw_container_name
}
output "curated_container_name" {
  value = var.curated_container_name
}
output "semantic_container_name" {
  value = var.semantic_container_name
}