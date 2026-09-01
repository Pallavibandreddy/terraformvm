variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "log_analytics_name" {
  type = string
}

variable "application_insights_name" {
  type = string
}

variable "log_analytics_sku" {
  description = "Log Analytics Workspace SKU"
  type        = string
}

variable "log_analytics_retention_days" {
  description = "Log Analytics data retention period in days"
  type        = number
}

variable "application_type" {
  description = "Application Insights application type"
  type        = string
}