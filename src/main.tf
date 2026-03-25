# (Only changed section shown for brevity)
resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  ...
  min_tls_version          = var.min_tls_version
  public_access            = false

  network_rules {
    default_action             = var.azurerm_storage_account_network_rules != null ? var.azurerm_storage_account_network_rules.default_action : "Allow"
    ip_rules                   = var.azurerm_storage_account_network_rules != null ? var.azurerm_storage_account_network_rules.ip_rules : []
    virtual_network_subnet_ids = var.allowed_subnet_ids
    bypass                     = var.azurerm_storage_account_network_rules != null ? var.azurerm_storage_account_network_rules.bypass : []
  }

  # Enhanced private link if enabled
  dynamic "enhanced_private_link" {
    for_each = var.enhanced_private_link ? [1] : []
    content {
      properties {}
    }
  }

  ...
}
