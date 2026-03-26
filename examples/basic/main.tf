module "storage" {
  source = "../../src"

  name                     = "exampleacct"
  resource_group_name      = "example-rg"
  location                 = "eastus"

  containers = [
    {
      name                  = "example-container"
      container_access_type = "private"
    }
  ]

  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
  enable_https_traffic_only = true
  min_tls_version          = "TLS1_2"
  tags = {
    environment = "test"
  }

  network_rules = {
    default_action = "Allow"
    ip_rules = ["1.2.3.4"]
    virtual_network_subnet_ids = []
  }
}
