variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_address_prefix" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "nic_config" {
  type = map(object({
    nic_name       = string
    public_ip_name = string
  }))
}

variable "private_endpoint_subnet_name" {
  description = "Name of the subnet used for private endpoints"
  type        = string
  default     = null
}

variable "private_endpoint_subnet_address_prefix" {
  description = "Address prefix for the private endpoint subnet"
  type        = string
  default     = null
}

variable "enable_app_service_delegation" {
  description = "Enable Microsoft.Web/serverFarms delegation for App Service VNet integration"
  type        = bool
  default     = false
}