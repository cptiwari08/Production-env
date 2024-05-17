resource "azurerm_resource_group" "PROD-RG" {
  for_each = var.prod_rg
  name     = each.value.rgname
  location = each.value.location
}