module "rg" {
  source = "../../modules/rg"

  resource_group_name = var.resource_group_name
  location            = var.location
}


module "net" {
  source = "../../modules/net"

  resource_group_name = module.rg.resource_group_name
  location            = var.location

  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix

  nsg_name = var.nsg_name

  nic_config = {
    for key, vm in var.vm_config : key => {
      nic_name       = vm.nic_name
      public_ip_name = vm.public_ip_name
    }
  }
}


module "vm" {
  for_each = var.vm_config

  source = "../../modules/vm"

  vm_name             = "${each.key}-vm"
  resource_group_name = module.rg.resource_group_name
  location            = var.location

  vm_size = each.value.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_id = module.net.nic_ids[each.key]
}