# Azure Storage Account Terraform Module

This module deploys an Azure Storage Account per AVM best practices.

## Usage

```hcl
module "example" {
  source  = "..."
  name    = "examplestg"
  resource_group_name = "example-rg"
  location = "eastus"
  # ... other variables ...
}
```

## Inputs
| Name | Description | Type | Default |
|------|-------------|------|---------|
| name | Storage Account name | string | n/a |
| resource_group_name | Resource group name | string | n/a |
| location | Azure location | string | n/a |
| account_tier | Account tier | string | "Standard" |
| account_replication_type | Replication type | string | "GRS" |
| account_kind | Storage Kind | string | "StorageV2" |
| minimum_tls_version | Minimum TLS version | string | "TLS1_2" |
| is_hns_enabled | Enable HNS | bool | false |
| access_tier | Blob access tier | string | "Hot" |
| network_default_action | Network Default Action | string | "Allow" |
| network_ip_rules | IP Rules | list(string) | [] |
| network_subnet_ids | Subnet IDs | list(string) | [] |
| blob_delete_retention_days | Blob retention days | number | 7 |
| enable_static_website | Enable static website | bool | false |
| static_website_index_document | Static website index | string | "index.html" |
| static_website_error_404_document | Static website error page | string | "404.html" |
| allow_blob_public_access | Allow blob public access | bool | false |
| allow_shared_key_access | Allow shared key access | bool | true |
| enable_diagnostics | Enable diagnostics | bool | false |
| diagnostics_workspace_id | Diagnostics Workspace | string | " " |
| tags | Resource tags | map(string) | {} |

**Note:** The default replication type is now `GRS` to meet AVM security requirements for geo-redundancy. If `LRS` (locally redundant storage) is required for your scenario, document the business justification explicitly in your deployment records.

## Outputs
| Name | Description |
|------|--------------|
| storage_account_id | Storage Account ID |
| primary_blob_endpoint | Blob endpoint |
| primary_web_endpoint | Static web endpoint |
| primary_access_key | Access key |

---

> Additional usage instructions and examples can be found in [examples/](./examples/) directory.
