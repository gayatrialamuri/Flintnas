variable "databricks_host" {
  description = "Azure Databricks workspace URL (no trailing slash)."
  type        = string
}

variable "databricks_token" {
  description = "Databricks personal access token."
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "Cluster name."
  type        = string
  default     = "dev-single-node"
}

variable "cluster_autotermination_minutes" {
  description = "Minutes of inactivity before auto-termination."
  type        = number
  default     = 30
}

variable "cluster_data_security_mode" {
  description = "Data security mode (e.g. NONE, SINGLE_USER, USER_ISOLATION)."
  type        = string
  default     = "NONE"
}

variable "cluster_spark_version" {
  description = "Databricks runtime version (or use data source for latest LTS)."
  type        = string
  default     = "14.3.x-scala2.12"
}

variable "cluster_node_type" {
  description = "Node type for driver/worker."
  type        = string
  # For free/cheap: pick a small SKU available in your region
  default = "Standard_DS3_v2"
}

variable "client_id" {
  description = "Azure AD client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure AD client secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "storage_account_name" {
  description = "Azure Storage account name"
  type        = string
  default     = "devadls"
}

variable "key_vault_name" {
  description = "Name of the Key Vault."
  type        = string
}