variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "client_id" {
  description = "Azure AD Service Principal Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure AD Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure AD Tenant ID"
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

variable "cluster_name" {
  description = "Name of the Databricks cluster"
  type        = string
  default     = "single-node-dev"
}

variable "cluster_autotermination_minutes" {
  description = "Cluster auto-termination time"
  type        = number
  default     = 20
}

variable "terraform_spn_object_id" {
  type        = string
  description = "Object ID of the Terraform Service Principal"
}

variable "postgres_server_name" {
  type        = string
  description = "Name of the PostgreSQL server"
}