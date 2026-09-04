variable "resource_group_name" {
  description = "Existing Task 6 resource group"
  type        = string
}

variable "key_vault_name" {
  description = "Task 7 Azure Key Vault name"
  type        = string
}

variable "initial_version" {
  description = "Initial application version"
  type        = string
  default     = "1.0.0"
}