resource "azurerm_network_security_rule" "this" {
  for_each = { for idx, rule in var.security_rules : idx => rule }

  network_security_group_name = local.resource_name
  resource_group_name         = var.resource_group_name

  name                       = each.value.name
  description                = try(each.value.description, null)
  protocol                   = try(each.value.protocol, "*")
  source_port_range          = try(each.value.source_port_range, null)
  destination_port_range     = try(each.value.destination_port_range, null)
  source_port_ranges         = try(each.value.source_port_ranges, null)
  destination_port_ranges    = try(each.value.destination_port_ranges, null)
  source_address_prefix      = try(each.value.source_address_prefix, null)
  destination_address_prefix = try(each.value.destination_address_prefix, null)
  source_address_prefixes    = try(each.value.source_address_prefixes, null)
  destination_address_prefixes = try(each.value.destination_address_prefixes, null)
  access                     = try(each.value.access, "Allow")
  priority                   = try(each.value.priority, 100)
  direction                  = try(each.value.direction, "Inbound")
  source_application_security_group_ids = try(each.value.source_application_security_group_ids, null)
  destination_application_security_group_ids = try(each.value.destination_application_security_group_ids, null)

  depends_on = [
    azurerm_network_security_group.this
  ]
}
