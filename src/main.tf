resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  allow_blob_public_access = var.allow_blob_public_access
  min_tls_version = var.min_tls_version

  tags = merge(
    var.tags,
    {
      Module = "terraform-azurerm-avm-res-storage-storageaccount"
    }
  )

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []
    content {
      type = identity.value
    }
  }
}

locals {
  storage_account_id = azurerm_storage_account.this.id
}
