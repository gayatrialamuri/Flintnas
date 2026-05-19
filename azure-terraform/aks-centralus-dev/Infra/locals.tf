locals {
  agic_identity = [
    for r in data.azurerm_resources.agic_identities.resources :
    r if startswith(r.name, "ingressapplicationgateway")
  ][0]

  agic_principal_id = local.agic_identity.identity.principal_id
}