variable "security_rules" {
  description = <<DESCRIPTION
A list of security rules to create in the Network Security Group.
DESCRIPTION

  type = list(object({
    name                       = string
    description                = optional(string)
    protocol                   = optional(string, null)
    source_port_range          = optional(string, null)
    destination_port_range     = optional(string, null)
    source_port_ranges         = optional(list(string), null)
    destination_port_ranges    = optional(list(string), null)
    source_address_prefix      = optional(string, null)
    destination_address_prefix = optional(string, null)
    source_address_prefixes    = optional(list(string), null)
    destination_address_prefixes = optional(list(string), null)
    access                     = optional(string)
    priority                   = optional(number)
    direction                  = optional(string)
    source_application_security_group_ids = optional(list(string), null)
    destination_application_security_group_ids = optional(list(string), null)
  }))

  default = []
}