variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "India South Central"
}

variable "resource_group_name" {
  description = "Task 6 resource group name"
  type        = string
  default     = "rg-task6-fullstack"
}

variable "app_service_plan_name" {
  description = "Task 6 App Service Plan"
  type        = string
  default     = "asp-task6-fullstack"
}

variable "ui_app_name" {
  description = "Task 6 UI App Service"
  type        = string
}

variable "api_app_name" {
  description = "Task 6 API App Service"
  type        = string
}

variable "node_version" {
  description = "Node.js runtime version"
  type        = string
  default     = "20-lts"
}