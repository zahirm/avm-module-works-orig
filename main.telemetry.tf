resource "azurerm_monitor_diagnostic_setting" "this" {
  for_each = var.diagnostic_settings

  name               = coalesce(each.value.name, "${local.resource_name}-diagsetting-${each.key}")
  target_resource_id = azurerm_network_security_group.this.id

  log_analytics_destination_type = each.value.log_analytics_destination_type
  log_analytics_workspaces       = each.value.workspace_resource_id != null ? [each.value.workspace_resource_id] : []
  storage_account_id            = each.value.storage_account_resource_id
  event_hub_authorization_rule_id = each.value.event_hub_authorization_rule_resource_id
  event_hub_name                = each.value.event_hub_name
  marketplace_partner_id        = each.value.marketplace_partner_resource_id

  dynamic "log" {
    for_each = length(each.value.log_categories) > 0 ? each.value.log_categories : []
    content {
      category = log.value
      enabled  = true
      retention_policy {
        enabled = false
        days    = 0
      }
    }
  }

  dynamic "metric" {
    for_each = length(each.value.metric_categories) > 0 ? each.value.metric_categories : []
    content {
      category = metric.value
      enabled  = true
      retention_policy {
        enabled = false
        days    = 0
      }
    }
  }
}
