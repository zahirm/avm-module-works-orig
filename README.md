# Azure Storage Account Module (AVM)

## Features
- Supports network rules via allowed_subnet_ids and azurerm_storage_account_network_rules
- Minimum TLS version configuration
- Enhanced private link support

## Variables
- allowed_subnet_ids
- azurerm_storage_account_network_rules
- min_tls_version
- data_residency_region
- enhanced_private_link

## Outputs
- storage_account_endpoints
- private_ip_address

(See variables.tf for full list)

## Example Usage

```hcl
module "storage_account" {
  source = "../src"
  ...
}
```
