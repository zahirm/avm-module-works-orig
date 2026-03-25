output "storage_account_id" {
  description = "The resource ID of the Storage Account."
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.this.name
}

output "storage_account_primary_web_endpoint" {
  description = "The URL of the primary web endpoint."
  value       = azurerm_storage_account.this.primary_web_endpoint
}

output "storage_account_primary_connection_string" {
  description = "The connection string for the primary location."
  value       = azurerm_storage_account.this.primary_connection_string
}

output "storage_account_primary_blob_endpoint" {
  description = "The blob endpoint for the primary location."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.this.primary_access_key
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key for the storage account."
  value       = azurerm_storage_account.this.secondary_access_key
  sensitive   = true
}
