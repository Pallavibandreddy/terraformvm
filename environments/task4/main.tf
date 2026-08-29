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
    vm1 = {
      nic_name       = "vm1-nic"
      public_ip_name = "vm1-pip"
    }
  }
}


module "vm" {
  source = "../../modules/vm"

  vm_name = "nginx-vm"

  resource_group_name = module.rg.resource_group_name
  location            = var.location

  vm_size = "Standard_B1s"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_id = module.net.nic_ids["vm1"]
}


resource "null_resource" "install_nginx" {

  depends_on = [
    module.vm
  ]

  connection {
    type     = "ssh"
    host     = module.net.public_ip_addresses["vm1"]
    user     = var.admin_username
    password = var.admin_password
  }

  provisioner "file" {
    source      = "${path.module}/script.sh"
    destination = "/tmp/install-nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install-nginx.sh",
      "sudo /tmp/install-nginx.sh"
    ]
  }
}