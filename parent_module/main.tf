module "rgs" {
  source = "../child_module/resource_group"
  rgs    = var.rgs

}
module "vnet" {
  source     = "../child_module/virtual_network"
  depends_on = [module.rgs]
  vnets      = var.vnets

}

module "subnets" {
  source     = "../child_module/subnet"
  depends_on = [module.vnet]
  subnets    = var.subnets
}

module "public_ip" {
  source     = "../child_module/public_ip"
  depends_on = [module.rgs]
  pips       = var.pips
}

module "nsgs" {
  source     = "../child_module/NSG"
  depends_on = [module.rgs]
  nsgs       = var.nsgs

}

module "nics" {
  source     = "../child_module/NIC"
  depends_on = [module.rgs, module.subnets, module.public_ip]
  nics       = var.nics

}

module "vms" {
  source     = "../child_module/virtual_machine"
  depends_on = [module.nics, module.rgs]
  vms        = var.vms

}

module "load_balancers" {
  source         = "../child_module/load_balancer"
  depends_on     = [module.rgs, module.public_ip]
  load_balancers = var.load_balancers

}

module "bastion" {
  source     = "../child_module/bastion"
  depends_on = [module.subnets, module.rgs, module.public_ip]
  bastions   = var.bastions

}
module "route_table" {
  depends_on = [module.rgs]
  source     = "../child_module/route_table"
  routes     = var.routes

}


module "peering" {
  depends_on = [module.vnet]
  source     = "../child_module/vnet_peering"
  peering    = var.peering

}

module "key_vault" {
  depends_on = [module.rgs]
  source     = "../child_module/Key_vault"
  key_vault  = var.key_vault

}
module "postgres" {
  depends_on = [module.rgs, module.subnets]
  source     = "../child_module/postgresql_database"
  postgresql = var.postgresql

}



module "private_endpoint" {
  depends_on       = [module.subnets, module.key_vault]
  source           = "../child_module/azurerm_private_endpoint"
  private_endpoint = var.private_endpoint

}

module "storage" {
  depends_on = [module.rgs]
  source     = "../child_module/azrerm_storage_account"
  storage    = var.storage

}
module "container" {
  depends_on = [module.storage]
  source     = "../child_module/azurerm_storage_container"
  container  = var.container

}
module "blob" {
  depends_on = [module.container]
  source     = "../child_module/azurerm_storage_blob"
  blob       = var.blob

}

module "azurerm_firewall" {
  depends_on = [ module.subnets, module.public_ip, module.rgs ]
  source = "../child_module/Azure_firewall"
  firewall = var.firewall
  
}