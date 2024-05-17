
data "azurerm_resource_group" "PROD-RG" {
    for_each = var.subnet
  name = each.value.resource_group_name
}

data "azurerm_virtual_network" "CPvnet" {
    for_each = var.subnet
  name                = each.value.virtual_network_name
  resource_group_name = data.azurerm_resource_group.datarg[each.key].name
}