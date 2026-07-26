module "resource_group" {
  source = "../../Child_Modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  source     = "../../Child_Modules/azurerm_virtual_network"
  depends_on = [module.resource_group]
  vnets      = var.vnets
}

module "subnet" {
  source     = "../../Child_Modules/azurerm_subnet"
  depends_on = [module.virtual_network]
  subnets    = var.subnets
}

module "public_ip" {
  source     = "../../Child_Modules/azurerm_public_ip"
  depends_on = [module.resource_group]
  public_ips = var.public_ips
}

module "network_interface" {
  source            = "../../Child_Modules/azurerm_network_interface"
  depends_on        = [module.subnet, module.public_ip]
  network_interface = var.network_interface
}

module "virtual_machine" {
  source     = "../../Child_Modules/azurem_virtual_machine"
  depends_on = [module.network_interface]
  vms        = var.virtual_machines
}

