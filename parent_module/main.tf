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
    source = "../child_module/load_balancer"
    depends_on = [ module.rgs,module.public_ip ]
    load_balancers = var.load_balancers
  
}

module "bastion" {
    source = "../child_module/bastion"
    depends_on = [ module.subnets,module.rgs,module.public_ip ]
     bastions = var.bastions


  
}    

