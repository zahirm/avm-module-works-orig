output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Name of the created storage account."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Blob endpoint URI."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "module_tags" {
  description = "Merged tags map."
  value       = local.tags
}
