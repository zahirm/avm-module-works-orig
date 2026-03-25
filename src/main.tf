resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location != null ? var.location : data.azurerm_resource_group.rg.location
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags

  network_rules {
    bypass                     = var.network_rules.bypass
    ip_rules                   = var.network_rules.ip_rules
    virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids
    default_action             = var.network_rules.default_action
  }
}

resource "azurerm_monitor_diagnostic_setting" "storage_account" {
  count                  = var.enable_diagnostics && var.log_analytics_workspace_id != null ? 1 : 0
  name                   = var.diagnostic_settings_name != null ? var.diagnostic_settings_name : "storage-account-diagnostics"
  target_resource_id     = azurerm_storage_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "StorageRead"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
  log {
    category = "StorageWrite"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
  log {
    category = "StorageDelete"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
