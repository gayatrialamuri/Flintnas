variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "raw_container_name" {
  type    = string
  default = "raw"
}

variable "curated_container_name" {
  type    = string
  default = "curated"
}

variable "key_vault_name" {
  type = string
}

variable "databricks_workspace_url" {
  type = string
}

variable "secrets_reader_object_id" {
  type        = string
  description = "Object ID of the Managed Identity used by Databricks Jobs"
}

variable "tags" {
  type    = map(string)
  default = {}
}