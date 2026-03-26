resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version          = var.min_tls_version
  tags                     = var.tags

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type = var.identity_type
    }
  }

  network_rules {
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "containers" {
  for_each            = { for c in var.containers : c => c }
  name               = each.key
  storage_account_name = azurerm_storage_account.this.name
  container_access_type = each.value.container_access_type
}

resource "azurerm_storage_account_network_rules" "network_rules" {
  count = 1
  storage_account_name = azurerm_storage_account.this.name
  default_action       = "Deny"
  ip_rules             = []
  virtual_network_subnet_ids = []
}
