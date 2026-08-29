output "resource_group_name" {
  value = module.rg.resource_group_name
}

output "vm_name" {
  value = module.vm.vm_name
}

output "public_ip_address" {
  value = module.net.public_ip_addresses["vm1"]
}

output "nginx_url" {
  value = "http://${module.net.public_ip_addresses["vm1"]}"
}