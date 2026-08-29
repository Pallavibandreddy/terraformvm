variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_address_prefix" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}