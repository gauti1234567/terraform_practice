variable "private_endpoint" {

}
resource "azurerm_private_endpoint" "private_endpoint" {
  for_each            = var.private_endpoint
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  subnet_id = data.azurerm_subnet.subdata[each.key].id

  private_service_connection {
    name                           = each.value.private_connection
    private_connection_resource_id = data.azurerm_key_vault.vault[each.key].id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
}

data "azurerm_key_vault" "vault" {
  for_each            = var.private_endpoint
  name                = each.value.key_vault
  resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "subdata" {
  for_each             = var.private_endpoint
  name                 = each.value.subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
