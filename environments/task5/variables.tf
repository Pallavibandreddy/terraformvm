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

variable "key_vault_subnet_id" {
  description = "Subnet ID for Key Vault Private Endpoint"
  type        = string
}

variable "virtual_network_id" {
  description = "Virtual Network ID"
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

variable "sql_server" {
  description = "Azure SQL Server FQDN"
  type        = string
}

variable "sql_database" {
  description = "Azure SQL Database name"
  type        = string
}

variable "key_vault_url" {
  description = "Azure Key Vault URI"
  type        = string
}
