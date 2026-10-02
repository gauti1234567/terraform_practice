resource "azurerm_firewall" "firewall" {
  for_each            = var.firewall
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier

  ip_configuration {
    name                 = each.value.ip_configuration
    subnet_id            = data.azurerm_subnet.subnet_data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id

  }
}

variable "firewall" {}

data "azurerm_subnet" "subnet_data" {
  for_each             = var.firewall
  name                 = each.value.subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "pip_data" {
  for_each            = var.firewall
  name                = each.value.public_ip
  resource_group_name = each.value.resource_group_name
}


