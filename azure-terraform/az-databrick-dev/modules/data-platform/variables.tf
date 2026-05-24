variable "resource_group_name" {
  description = "Resource group containing the data platform resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the ADLS Gen2 storage account"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "raw_container_name" {
  description = "Raw container name"
  type        = string
}

variable "curated_container_name" {
  description = "Curated container name"
  type        = string
}

variable "semantic_container_name" {
  description = "Semantic container name"
  type        = string
}

variable "secrets_reader_object_id" {
  description = "Object ID of identity that reads secrets (Databricks Job MI)"
  type        = string
}