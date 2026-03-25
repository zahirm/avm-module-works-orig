# Storage Account AVM Module Sync

This module creates and manages an Azure Storage Account with flexible configuration options. Inputs and outputs have been enhanced based on the Azure Verified Module source baseline.

## Inputs
- name
- resource_group_name
- location
- account_kind
- account_tier
- account_replication_type
- tags
- enable_diagnostics
- diagnostic_settings_name
- log_analytics_workspace_id
- network_rules

## Outputs
- storage_account_id
- storage_account_name
- primary_blob_endpoint
- network_rules

## Example Usage

```hcl
module "storage_account" {
  source                     = "./src"
  name                       = "examplestorage"
  resource_group_name        = "example-rg"
  location                   = "eastus"
  account_kind               = "StorageV2"
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  tags                       = { environment = "dev" }
  enable_diagnostics         = true
  log_analytics_workspace_id = "<workspace_resource_id>"
  network_rules = {
    bypass = ["AzureServices"]
    ip_rules = ["1.2.3.4"]
    virtual_network_subnet_ids = []
    default_action = "Allow"
  }
}
```
