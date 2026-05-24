module "infra" {
  source = "./infra"

  storage_account_name      = var.storage_account_name
  key_vault_name            = var.key_vault_name
  tenant_id                 = var.tenant_id
  terraform_spn_object_id   = var.terraform_spn_object_id
  postgres_server_name      = var.postgres_server_name
}

module "data_platform" {
  source = "./modules/data-platform"

  resource_group_name = module.infra.resource_group_name
  location            = module.infra.location

  storage_account_name = var.storage_account_name
  key_vault_name       = var.key_vault_name

  raw_container_name      = "raw"
  curated_container_name  = "curated"
  semantic_container_name = "semantic"

  secrets_reader_object_id = module.infra.job_identity_principal_id
}

module "databricks" {
  source = "./databricks"

  cluster_autotermination_minutes = var.cluster_autotermination_minutes
  client_id                       = var.client_id
  cluster_name                    = var.cluster_name
  workspace_url = module.infra.databricks_workspace_url
  workspace_id  = module.infra.databricks_workspace_id
  key_vault_id  = module.infra.key_vault_id
  key_vault_uri = module.infra.key_vault_uri
}