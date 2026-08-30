variable "app_service_name" {
  description = "Name of the Azure App Service"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
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

variable "sku_name" {
  description = "App Service Plan SKU"
  type        = string
  default     = "B1"
}

variable "app_subnet_id" {
  description = "Subnet ID for App Service VNet integration"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault resource ID"
  type        = string
}

variable "sql_server" {
  description = "Azure SQL Server hostname"
  type        = string
}

variable "sql_database" {
  description = "Azure SQL Database name"
  type        = string
}

variable "key_vault_url" {
  description = "Azure Key Vault URL"
  type        = string
}

variable "app_insights_instrumentation_key" {
  description = "Application Insights instrumentation key"
  type        = string
}