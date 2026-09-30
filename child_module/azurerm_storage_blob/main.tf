variable "blob" {

}
resource "azurerm_storage_blob" "blob" {
  for_each             = var.blob
  name                 = each.value.blob_name
  storage_container_id = data.azurerm_storage_container.container[each.key].id
  type                 = each.value.type
  source               = each.value.source

}

data "azurerm_storage_account" "stg_data" {
  for_each            = var.blob
  name                = each.value.storage
  resource_group_name = each.value.resource_group_name
}

data "azurerm_storage_container" "container" {
  for_each           = var.blob
  name               = each.value.container
  storage_account_id = data.azurerm_storage_account.stg_data[each.key].id
}
