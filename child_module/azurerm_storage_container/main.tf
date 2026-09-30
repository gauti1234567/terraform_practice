variable "container" {}
resource "azurerm_storage_container" "container" {
  for_each              = var.container
  name                  = each.value.name
  storage_account_id    = data.azurerm_storage_account.stgs_data[each.key].id
  container_access_type = each.value.container_access_type
}

data "azurerm_storage_account" "stgs_data" {
  for_each            = var.container
  name                = each.value.storage
  resource_group_name = each.value.resource_group_name
}
