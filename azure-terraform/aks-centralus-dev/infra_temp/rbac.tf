resource "azurerm_role_assignment" "agic_reader_rg" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = local.agic_object_id
}

resource "azurerm_role_assignment" "agic_contributor_appgw" {
  scope                = azurerm_application_gateway.appgw.id
  role_definition_name = "Contributor"
  principal_id         = local.agic_object_id
}