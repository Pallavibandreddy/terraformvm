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

variable "app_insights_instrumentation_key_secret_uri" {
  description = "Key Vault secret URI for Application Insights instrumentation key"
  type        = string
}

variable "os_type" {
  description = "Operating system type for the App Service Plan"
  type        = string
}

variable "identity_type" {
  description = "Managed identity type for the App Service"
  type        = string
}

variable "always_on" {
  description = "Whether the App Service should always be running"
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
  description = "Key Vault RBAC role assigned to the App Service identity"
  type        = string
}