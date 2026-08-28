module "rg" {
  source = "../../modules/rg"

  resource_group_name = var.resource_group_name
  location            = var.location
}


module "net" {
  source = "../../modules/net"

  resource_group_name = module.rg.resource_group_name
  location            = var.location

  vnet_name              = var.vnet_name
  vnet_address_space     = var.vnet_address_space
  subnet_name            = var.subnet_name
  subnet_address_prefix  = var.subnet_address_prefix

  nsg_name = var.nsg_name

  nic_config = {
    for i in range(var.vm_count) : "vm${i + 1}" => {
      nic_name       = "vm${i + 1}-nic"
      public_ip_name = "vm${i + 1}-pip"
    }
  }
}


module "vm" {
  count = var.vm_count

  source = "../../modules/vm"

  vm_name = "vm${count.index + 1}-vm"

  resource_group_name = module.rg.resource_group_name
  location            = var.location

  vm_size = "Standard_B1s"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_id = module.net.nic_ids["vm${count.index + 1}"]
}