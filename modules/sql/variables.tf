variable "sql_server_name" {
  description = "Azure SQL logical server name"
  type        = string
}

variable "sql_database_name" {
  description = "Azure SQL database name"
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

variable "administrator_login" {
  description = "Microsoft Entra administrator login"
  type        = string
}

variable "administrator_object_id" {
  description = "Microsoft Entra administrator object ID"
  type        = string
}

variable "app_service_principal_id" {
  description = "App Service managed identity principal ID"
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

variable "public_network_access_enabled" {
  description = "Enable public network access to SQL Server"
  type        = bool
}

variable "sql_database_sku" {
  description = "SQL Database SKU"
  type        = string
}