output "storage_account_endpoints" {
  description = "Endpoints of the storage account."
  value = azurerm_storage_account.this.primary_endpoints
}

output "private_ip_address" {
  description = "Private IP address for the storage account private endpoint."
  value = try(azurerm_private_endpoint.this.private_service_connection[0].private_ip_address, null)
}

# ...[existing outputs preserved]...
