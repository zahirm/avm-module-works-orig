output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "The primary endpoint for Blob storage."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "network_rules" {
  description = "Network rules applied to the Storage Account."
  value       = azurerm_storage_account.this.network_rules
}
