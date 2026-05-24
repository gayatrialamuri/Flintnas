# ---------------------------------------------------------
# PostgreSQL Admin Credentials stored in Key Vault
# ---------------------------------------------------------

resource "azurerm_key_vault_secret" "postgres_admin_user" {
  name         = "postgres-admin-user"
  value        = "pgadminuser"
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "postgres_admin_password" {
  name         = "postgres-admin-password"
  value        = random_password.postgres_admin_password.result
  key_vault_id = azurerm_key_vault.kv.id
}

resource "random_password" "postgres_admin_password" {
  length  = 20
  special = true
}

# ---------------------------------------------------------
# PostgreSQL Flexible Server
# ---------------------------------------------------------

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = var.postgres_server_name
  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location

  administrator_login    = azurerm_key_vault_secret.postgres_admin_user.value
  administrator_password = azurerm_key_vault_secret.postgres_admin_password.value

  zone = var.postgres_zone

  version    = "16"
  storage_mb = 32768
  sku_name   = "B_Standard_B1ms"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  # ✔ Correct for provider 4.74.0
  public_network_access_enabled = true

  tags = {
    Environment = "dev"
    Owner       = "newsun"
  }
}

# ---------------------------------------------------------
# Create a database inside the server
# ---------------------------------------------------------

resource "azurerm_postgresql_flexible_server_database" "appdb" {
  name      = "appdb"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}