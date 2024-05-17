data "azurerm_resource_group" "datansgrg" {
  for_each = var.nsggroup
  name     = each.value.resource_group_name
}

data "azurerm_network_security_group" "datanetwork" {
  for_each = var.nsggroup
  name     = each.value.name
  resource_group_name = data.azurerm_resource_group.datansgrg[each.key].name
}

data "azurerm_virtual_network" "datavnet" {
  for_each = var.datansg  
  name                = each.value.virtual_network_name
  resource_group_name = data.azurerm_resource_group.datansgrg[each.key].name
}

data "azurerm_subnet" "datasub" {
  for_each            = var.datansg  
  name                = each.value.subnet_name
  virtual_network_name = data.azurerm_virtual_network.datavnet[each.key].name
  resource_group_name = data.azurerm_resource_group.datansgrg[each.key].name
}
