variable "name" {
  description = "The name of the storage account."
  type        = string
  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 24
    error_message = "Storage account name must be between 3 and 24 characters."
  }
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "account_tier" {
  description = "Storage account tier."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type."
  type        = string
  default     = "LRS"
}

variable "enable_https_traffic_only" {
  description = "Enables HTTPS traffic only."
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "Minimum TLS version allowed."
  type        = string
  default     = "TLS1_2"
}

variable "allow_blob_public_access" {
  description = "Allow blob public access."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the resource."
  type        = map(string)
  default     = {}
}

variable "network_rules" {
  description = "Network rules object as per AVM."
  type = object({
    default_action = string
    bypass = list(string)
    ip_rules = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = null
}

variable "diagnostic_settings" {
  description = "Diagnostics settings object."
  type = object({
    logs = list(object({
      category = string
      enabled  = bool
      retention_policy = object({
        enabled = bool
        days    = number
      })
    }))
    metrics = list(object({
      category = string
      enabled  = bool
      retention_policy = object({
        enabled = bool
        days    = number
      })
    }))
  })
  default = null
}
