variable "location" {
  description = "Azure region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "key_vault_name" {
  description = "Key Vault name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual Network address space"
  type        = string
}

variable "subnet_name" {
  description = "Application subnet name"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Application subnet address prefix"
  type        = string
}

variable "private_endpoint_subnet_name" {
  description = "Private Endpoint subnet name"
  type        = string
}

variable "private_endpoint_subnet_address_prefix" {
  description = "Private Endpoint subnet address prefix"
  type        = string
}

variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

variable "nic_config" {
  description = "NIC configuration"
  type = map(object({
    nic_name       = string
    public_ip_name = string
  }))
}

variable "app_service_name" {
  description = "App Service name"
  type        = string
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
}

variable "app_service_sku" {
  description = "App Service Plan SKU"
  type        = string
}


variable "enable_app_service_delegation" {
  description = "Enable App Service subnet delegation"
  type        = bool
}

variable "sql_server_name" {
  description = "SQL Server name"
  type        = string
}

variable "sql_database_name" {
  description = "SQL Database name"
  type        = string
}

variable "sql_administrator_login" {
  description = "Microsoft Entra administrator login"
  type        = string
}

variable "sql_administrator_object_id" {
  description = "Microsoft Entra administrator object ID"
  type        = string
}

variable "application_insights_name" {
  description = "Application Insights name"
  type        = string
}

variable "log_analytics_name" {
  description = "Log Analytics Workspace name"
  type        = string
}

variable "os_type" {
  description = "Operating system type"
  type        = string
}

variable "identity_type" {
  description = "Managed identity type"
  type        = string
}

variable "always_on" {
  description = "Keep App Service always running"
  type        = bool
}

variable "app_command_line" {
  description = "Application startup command"
  type        = string
}

variable "node_version" {
  description = "Node.js runtime version"
  type        = string
}

variable "scm_do_build_during_deployment" {
  description = "Enable SCM build during deployment"
  type        = string
}

variable "enable_oryx_build" {
  description = "Enable Oryx build"
  type        = string
}

variable "key_vault_role" {
  description = "Key Vault RBAC role"
  type        = string
}

variable "key_vault_sku" {
  description = "Key Vault SKU"
  type        = string
}

variable "key_vault_rbac_enabled" {
  description = "Enable Key Vault RBAC authorization"
  type        = bool
}

variable "key_vault_public_network_access_enabled" {
  description = "Enable public network access to Key Vault"
  type        = bool
}

variable "key_vault_purge_protection_enabled" {
  description = "Enable Key Vault purge protection"
  type        = bool
}

variable "key_vault_soft_delete_retention_days" {
  description = "Key Vault soft delete retention period"
  type        = number
}

variable "key_vault_private_dns_zone_name" {
  description = "Private DNS zone name for Key Vault"
  type        = string
}

variable "key_vault_private_endpoint_manual" {
  description = "Require manual private endpoint approval"
  type        = bool
}

variable "key_vault_subresource_names" {
  description = "Key Vault private endpoint subresources"
  type        = list(string)
}

variable "key_vault_dns_zone_group_name" {
  description = "Private DNS zone group name"
  type        = string
}

variable "log_analytics_sku" {
  description = "Log Analytics Workspace SKU"
  type        = string
}

variable "log_analytics_retention_days" {
  description = "Log Analytics retention period in days"
  type        = number
}

variable "application_type" {
  description = "Application Insights application type"
  type        = string
}

variable "app_insights_location" {
  description = "Azure region for Application Insights and Log Analytics"
  type        = string
}

variable "sql_server_version" {
  description = "SQL Server version"
  type        = string
}

variable "azuread_authentication_only" {
  description = "Enable Microsoft Entra-only authentication"
  type        = bool
}

variable "sql_public_network_access_enabled" {
  description = "Enable public network access to SQL Server"
  type        = bool
}

variable "sql_database_sku" {
  description = "SQL Database SKU"
  type        = string
}

variable "security_rules" {
  description = "Network Security Group rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}