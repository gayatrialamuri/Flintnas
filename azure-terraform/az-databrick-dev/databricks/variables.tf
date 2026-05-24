variable "cluster_autotermination_minutes" {
  type        = number
  description = "Auto-termination time for the Databricks cluster"
}

variable "client_id" {
  type        = string
  description = "Service Principal Client ID for SINGLE_USER mode"
}

variable "cluster_name" {
  type        = string
  description = "Name of the Databricks cluster"
}

variable "workspace_url" {
  type        = string
  description = "Databricks workspace URL"
}

variable "workspace_id" {
  type        = string
  description = "Databricks workspace ID"
}

variable "key_vault_id" {
  type = string
}

variable "key_vault_uri" {
  type = string
}