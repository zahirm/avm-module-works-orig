variable "name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account should be created."
  type        = string
  default     = null
}

variable "account_kind" {
  description = "The Kind of storage account."
  type        = string
  default     = "StorageV2"
  validation {
    condition     = contains(["Storage", "StorageV2", "BlobStorage", "BlockBlobStorage", "FileStorage"], var.account_kind)
    error_message = "account_kind must be one of: Storage, StorageV2, BlobStorage, BlockBlobStorage, or FileStorage."
  }
}

variable "account_tier" {
  description = "The Tier of the storage account (Standard or Premium)."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be either Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "The Replication type of the storage account."
  type        = string
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "account_replication_type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, or RAGZRS."
  }
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "enable_diagnostics" {
  description = "Whether to enable diagnostic settings for the Storage Account."
  type        = bool
  default     = true
}

variable "diagnostic_settings_name" {
  description = "The name of the diagnostic settings."
  type        = string
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "The resource ID of the Log Analytics Workspace to send diagnostics to."
  type        = string
  default     = null
}

variable "network_rules" {
  description = "Network rules for the storage account."
  type        = object({
    bypass              = list(string)
    ip_rules            = list(string)
    virtual_network_subnet_ids = list(string)
    default_action      = string
  })
  default = {
    bypass = ["AzureServices"]
    ip_rules = []
    virtual_network_subnet_ids = []
    default_action = "Allow"
  }
}
