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

variable "sku_name" {
  description = "Key Vault SKU"
  type        = string
}

variable "rbac_authorization_enabled" {
  description = "Enable RBAC authorization for Key Vault"
  type        = bool
}

variable "public_network_access_enabled" {
  description = "Allow public network access to Key Vault"
  type        = bool
}

variable "purge_protection_enabled" {
  description = "Enable purge protection for Key Vault"
  type        = bool
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain deleted Key Vault objects"
  type        = number
}

variable "private_dns_zone_name" {
  description = "Private DNS zone name for Key Vault"
  type        = string
}

variable "is_manual_connection" {
  description = "Whether the private endpoint connection requires manual approval"
  type        = bool
}

variable "subresource_names" {
  description = "Private endpoint subresource names"
  type        = list(string)
}

variable "private_dns_zone_group_name" {
  description = "Private DNS zone group name"
  type        = string
}

variable "app_insights_instrumentation_key" {
  description = "Application Insights instrumentation key stored in Key Vault"
  type        = string
  sensitive   = true
}