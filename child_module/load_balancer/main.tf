resource "azurerm_lb" "load_balancer" {
  for_each            = var.load_balancers
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }
}

variable "load_balancers" {}

data "azurerm_public_ip" "pip_data" {
  for_each            = var.load_balancers
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
