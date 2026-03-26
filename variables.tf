variable "name" {
  type        = string
  description = "Name of the Storage Account."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "location" {
  type        = string
  description = "Azure location."
}

variable "account_tier" {
  type        = string
  description = "Account tier."
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Replication type."
  default     = "GRS"
}

variable "account_kind" {
  type        = string
  description = "Storage Kind."
  default     = "StorageV2"
}

variable "minimum_tls_version" {
  type        = string
  description = "Minimum TLS version."
  default     = "TLS1_2"
}

variable "is_hns_enabled" {
  type        = bool
  description = "Enable Hierarchical Namespace."
  default     = false
}

variable "access_tier" {
  type        = string
  description = "Access tier for blob storage."
  default     = "Hot"
}

variable "network_default_action" {
  type        = string
  description = "Default network rule."
  default     = "Allow"
}

variable "network_ip_rules" {
  type        = list(string)
  description = "IP rules for network."
  default     = []
}

variable "network_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for network."
  default     = []
}

variable "blob_delete_retention_days" {
  type        = number
  description = "Number of days for blob retention policy."
  default     = 7
}

variable "enable_static_website" {
  type        = bool
  description = "Enable static website."
  default     = false
}

variable "static_website_index_document" {
  type        = string
  description = "Index Document for static site."
  default     = "index.html"
}

variable "static_website_error_404_document" {
  type        = string
  description = "404 Document for static site."
  default     = "404.html"
}

variable "allow_blob_public_access" {
  type        = bool
  description = "Allow blob public access."
  default     = false
}

variable "allow_shared_key_access" {
  type        = bool
  description = "Allow shared key access."
  default     = true
}

variable "enable_diagnostics" {
  type        = bool
  description = "Enable monitoring diagnostics."
  default     = false
}

variable "diagnostics_workspace_id" {
  type        = string
  description = "Log Analytics Workspace for diagnostics."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}