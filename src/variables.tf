variable "name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "location" {
  description = "Azure location for the Storage Account."
  type        = string
}

variable "account_tier" {
  description = "The storage account tier."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "Tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Replication type for the account."
  type        = string
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Replication type is invalid."
  }
}

variable "access_tier" {
  description = "Access tier for the storage account."
  type        = string
  default     = "Hot"
  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "Access tier must be Hot or Cool."
  }
}

variable "enable_https_traffic_only" {
  description = "Should only HTTPS traffic be enabled?"
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "Minimum TLS version."
  type        = string
  default     = "TLS1_2"
}

variable "identity_type" {
  description = "Identity type for the storage account."
  type        = string
  default     = null
  nullable    = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "network_rules" {
  description = "Network rules configuration block for storage account access."
  type = object({
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = null
  nullable = true
}

variable "containers" {
  description = "Containers to create in the storage account."
  type = list(object({
    name                  = string
    container_access_type = string
  }))
  default = []
}
