module "resource_group" {
  source = "../../modules/rg"

  resource_group_name = var.resource_group_name
  location            = var.location

}

module "network" {
  source = "../../modules/net"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix

  nsg_name = var.nsg_name

  nic_config = {
    vm1 = {
      nic_name       = var.nic_name
      public_ip_name = var.public_ip_name
    }
  }

  security_rules = var.security_rules
}


module "vm" {
  source = "../../modules/vm"

  vm_name             = var.vm_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_id = module.network.nic_id

}