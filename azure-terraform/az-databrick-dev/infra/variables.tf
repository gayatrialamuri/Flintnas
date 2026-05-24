variable "storage_account_name" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "terraform_spn_object_id" {
  type        = string
  description = "Object ID of the Terraform Service Principal"
}

variable "postgres_server_name" {
  type        = string
  description = "Name of the PostgreSQL server"
}

variable "postgres_zone" {
  type    = number
  default = 1
}