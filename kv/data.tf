data "azurerm_resource_group" "datarg" {
  for_each = var.keyvault
name = var.resource_group_name
}
data "azurerm_client_config" "current" {}
