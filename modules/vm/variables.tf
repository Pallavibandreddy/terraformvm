variable "vm_name" {
  description = "taskvm"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "network_interface_id" {
  description = "Network interface ID"
  type        = string
}

