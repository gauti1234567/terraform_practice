resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastions
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet_data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }
}
variable "bastions" {}

data "azurerm_public_ip" "pip_data" {
  for_each            = var.bastions
  name                = each.value.public_ip
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet_data" {
  for_each             = var.bastions
  name                 = each.value.subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
