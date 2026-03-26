output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.this.name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "container_ids" {
  description = "Map of container names to their IDs."
  value       = { for c, resource in azurerm_storage_container.containers : c => resource.id }
}
