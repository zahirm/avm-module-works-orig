resource "azurerm_storage_account" "this" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  tags                     = var.tags

  allow_blob_public_access = false
  min_tls_version = "TLS1_2"

  dynamic "network_rules" {
    for_each = var.network_rules != null ? [var.network_rules] : []
    content {
      bypass                     = lookup(network_rules.value, "bypass", [])
      default_action             = lookup(network_rules.value, "default_action", "Allow")
      ip_rules                   = lookup(network_rules.value, "ip_rules", null)
      virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", null)
      # ... more fields if applicable
    }
  }

  # Source module logic for blobs, file, encryption, identity, and so on.
  # ...
}

resource "azurerm_monitor_diagnostic_setting" "sa_logging" {
  name                       = "storageaccount-logging"
  target_resource_id         = azurerm_storage_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "AuditLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 90
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 90
    }
  }
}
