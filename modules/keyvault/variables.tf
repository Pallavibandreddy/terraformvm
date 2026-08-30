variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the Key Vault private endpoint"
  type        = string
}

variable "virtual_network_id" {
  description = "Virtual Network ID for the Private DNS Zone link"
  type        = string
}