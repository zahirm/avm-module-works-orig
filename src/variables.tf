variable "storage_account_name" {
  description = "The name of the storage account. Must be unique."
  type        = string
  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
    error_message = "Storage account name must be between 3 and 24 characters."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure location (region)."
  type        = string
  default     = "eastus"
}

variable "account_tier" {
  description = "Tier of the Storage Account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type of the Storage Account."
  type        = string
  default     = "LRS"
}

variable "enable_https_traffic_only" {
  description = "Force HTTPS for all traffic."
  type        = bool
  default     = true
}

variable "allow_blob_public_access" {
  description = "Allow public access to blobs."
  type        = bool
  default     = false
}

variable "min_tls_version" {
  description = "Minimum TLS version allowed."
  type        = string
  default     = "TLS1_2"
}

variable "identity_type" {
  description = "Managed identity type."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for the storage account."
  type        = map(string)
  default     = {}
}
