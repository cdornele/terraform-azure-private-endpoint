#--------------------------------------------*--------------------------------------------
# Module: Azure Private Endpoint - Variables
#--------------------------------------------*--------------------------------------------

variable "private_endpoint_stack" {
  description = "Name of resource."
  type = string
}

variable "location" {
  description = "Azure location"
}

variable "resource_group_name" {
  description = "Name of resource group"
  type = string
}

variable "private_endpoint_prefixes" {
  description = "List of prefixes for private endpoint"
  type = list(string)
  default = []
}

variable "private_endpoint_suffixes" {
  description = "List of suffixes for private endpoint"
  type = list(string)
  default = []
}

variable "private_service_connection_stack" {
  description = "Name of resource."
  type = string
}

variable "private_service_connection_prefixes" {
  description = "List of prefixes for private service connection"
  type = list(string)
  default = []
}
variable "private_service_connection_suffixes" {
  description = "List of suffixes for private service connection"
  type = list(string)
  default = []
}

variable "private_endpoint_nic_custom_name" {
  description = "Name of the network interface"
  type = string
  default = null
}

variable "private_endpoint_subnet_id" {
  description = "ID of the subnet where the private endpoint will be created"
  type = string
}

variable "private_endpoint_target_resource" {
  description = "Target resource for the private endpoint"
  type = string
  default = null
}

variable "private_endpoint_ip_configurations" {
  description = "IP configurations for the private endpoint"
  type = list(object({
    name               = optional(string, "ipconfig")
    member_name        = optional(string)
    subresource_name   = optional(string)
    private_ip_address = string
  }))
  default = []
  nullable = false
}

variable "private_endpoint_subresource_name" {
  description = "Subresource name for the private endpoint"
  type = string
  default = null
}

variable "private_endpoint_is_manual_connection" {
  description = "Is manual connection"
  type = bool
  default = false
}

variable "private_endpoint_request_message" {
  description = "Request message"
  type = string
  default = null
}

variable "private_endpoint_tags" {
  description = "Tags for the private endpoint"
  type = map(string)
  default = {}
}

#--------------------------------------------*--------------------------------------------