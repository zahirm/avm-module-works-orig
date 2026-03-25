variable "allowed_subnet_ids" {
  description = "A list of subnet IDs allowed to access the storage account."
  type        = list(string)
  default     = []
}

variable "azurerm_storage_account_network_rules" {
  description = "Network rules configuration block for the Storage Account."
  type        = any
  default     = null
}

variable "min_tls_version" {
  description = "Minimum TLS version for the Storage Account."
  type        = string
  default     = "TLS1_2"
}

variable "data_residency_region" {
  description = "Region for data residency requirements."
  type        = string
  default     = null
}

variable "enhanced_private_link" {
  description = "Enable enhanced private link for improved security."
  type        = bool
  default     = false
}

# ...[existing variables preserved]...
