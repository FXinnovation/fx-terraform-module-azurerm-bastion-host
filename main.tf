locals {
  bastion_host_ip_configuration = var.public_ip_enabled || var.existing_public_ip_enabled
}


###
# Public IP
###

resource "azurerm_public_ip" "this" {
  count = var.enabled && var.public_ip_enabled ? 1 : 0

  name                = var.public_ip_name
  location            = var.public_ip_location
  resource_group_name = var.public_ip_resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku

  tags = merge(
    var.tags,
    var.public_ip_tags,
    {
      "Terraform" = "true"
    }
  )

}

###
# Bastion host
###

resource "azurerm_bastion_host" "this" {
  count = var.enabled ? 1 : 0

  name                = var.bastion_host_name
  location            = var.bastion_host_location
  resource_group_name = var.bastion_host_resource_group_name

  dynamic "ip_configuration" {
    for_each = local.bastion_host_ip_configuration ? var.ip_configurations : []

    content {
      name                 = ip_configuration.value.name
      subnet_id            = ip_configuration.value.subnet_id
      public_ip_address_id = var.public_ip_enabled ? azurerm_public_ip.this.0.id : var.existing_public_ip_address_id
    }
  }

  tags = merge(
    var.tags,
    var.bastion_host_tags,
    {
      "Terraform" = "true"
    }
  )
}
