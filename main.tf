resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  # SECURITY: Hardcoded remediation
  allow_blob_public_access     = false # [control: allow_blob_public_access]
  shared_access_key_enabled    = false # [control: shared_access_key_enabled]
  min_tls_version              = "TLS1_2" # [control: min_tls_version]
  enable_https_traffic_only    = true # [control: enable_https_traffic_only]

  # Harden network rules
  network_rules {
    default_action             = "Deny" # [control: network_rules_default_action]
    bypass                     = ["AzureServices"]
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }

  # Everything else remains mapped to variables for feature-completeness
  is_hns_enabled           = var.is_hns_enabled
  nfsv3_enabled            = var.nfsv3_enabled
  large_file_share_enabled = var.large_file_share_enabled
  default_to_oauth_authentication = var.default_to_oauth_authentication
  custom_domain {
    name          = var.custom_domain_name
    use_subdomain = var.custom_domain_use_subdomain
  }
  identity {
    type = var.identity_type
    identities = var.identity_user_assigned_identities
  }
  blob_properties {
    versioning_enabled            = var.blob_versioning_enabled
    change_feed_enabled           = var.blob_change_feed_enabled
    change_feed_retention_in_days = var.blob_change_feed_retention_in_days
    delete_retention_policy {
      days = var.blob_delete_retention_days
    }
    container_delete_retention_policy {
      days = var.container_delete_retention_days
    }
  }
  static_website {
    index_document     = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
  }
  tags = {
    Owner      = "avm-security-reviewed"
    Environment = "production"
  }
}
