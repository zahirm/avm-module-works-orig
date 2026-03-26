# Storage Account Module

## Usage
```hcl
module "storage_account" {
  source = "../"
  name                   = "example-storage"
  resource_group_name    = "example-rg"
  location               = "eastus"
  account_tier           = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true
  min_tls_version = "TLS1_2"
  allow_blob_public_access = false
  tags = {
    environment = "dev"
    app = "myapp"
  }
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | The name of the storage account | string | n/a | yes |
| resource_group_name | Resource group name | string | n/a | yes |
| location | Azure region | string | n/a | yes |
| account_tier | Storage account tier | string | "Standard" | no |
| account_replication_type | Replication type | string | "LRS" | no |
| enable_https_traffic_only | Enable HTTPS only | bool | true | no |
| min_tls_version | Minimum TLS version | string | "TLS1_2" | no |
| allow_blob_public_access | Allow blob public access | bool | false | no |
| tags | Resource tags | map(string) | {} | no |
| network_rules | Network rules object | object | null | no |
| diagnostic_settings | Diagnostics settings | object | null | no |

## Outputs
| Name | Description |
|------|-------------|
| storage_account_id | Storage account resource ID |
| storage_account_name | Storage account name |
| primary_blob_endpoint | Blob endpoint |
| module_tags | Merged tags map |
