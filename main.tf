resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version = var.min_tls_version
  allow_blob_public_access = var.allow_blob_public_access
  tags = local.tags

  lifecycle {
    prevent_destroy = true
  }

  dynamic "network_rules" {
    for_each = var.network_rules != null ? [var.network_rules] : []
    content {
      default_action = network_rules.value.default_action
      bypass         = network_rules.value.bypass
      ip_rules       = network_rules.value.ip_rules
      virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.diagnostic_settings != null ? 1 : 0
  name               = "diagstorage"
  target_resource_id = azurerm_storage_account.this.id
  ... # Skipping for brevity, see source for full logic
  logs = var.diagnostic_settings != null ? var.diagnostic_settings.logs : []
  metrics = var.diagnostic_settings != null ? var.diagnostic_settings.metrics : []
}

locals {
  tags = merge(
    {
      "module" = "storage-account"
    },
    var.tags
  )
}
