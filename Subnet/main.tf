resource "azurerm_subnet" "Prod_sab" {
  for_each             = var.subnet
  name                 = each.value.subname
  resource_group_name  = data.azurerm_resource_group.PROD-RG[each.key].name
  virtual_network_name = data.azurerm_virtual_network.CPvnet[each.key].name
  address_prefixes     = each.value.address_prefixes

}
