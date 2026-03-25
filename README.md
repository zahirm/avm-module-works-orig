# AVM Storage Account Module

This module creates an Azure Storage Account using AVM-compliant patterns.

## Inputs

| Name                    | Description                                    | Type      | Default    |
|-------------------------|------------------------------------------------|-----------|------------|
| storage_account_name    | Unique name for storage account                | string    | n/a        |
| resource_group_name     | Resource group name                            | string    | n/a        |
| location                | Azure region                                   | string    | eastus     |
| account_tier            | Storage account tier (Standard/Premium)        | string    | Standard   |
| account_replication_type| Replication type (LRS, GRS, etc.)              | string    | LRS        |
| enable_https_traffic_only| Enable HTTPS only                             | bool      | true       |
| allow_blob_public_access| Allow public blob access                       | bool      | false      |
| min_tls_version         | Minimum TLS version allowed                    | string    | TLS1_2     |
| identity_type           | Managed identity type                          | string    | null       |
| tags                    | Tags for resources                             | map(string)| {}         |

## Outputs

| Name                  | Description                     |
|-----------------------|----------------------------------|
| storage_account_id    | Storage Account resource ID      |
| storage_account_name  | Name of the Storage Account      |
| primary_blob_endpoint | Storage blob endpoint URL        |

## Example Usage

```hcl
module "storage_account" {
  source                  = "../src"
  storage_account_name    = "myuniquestorageacct01"
  resource_group_name     = "my-rg"
  location                = "eastus"
  account_tier            = "Standard"
  account_replication_type= "LRS"
  enable_https_traffic_only = true
  allow_blob_public_access = false
  tags = {
    Environment = "production"
    Owner       = "devops"
  }
}
```
