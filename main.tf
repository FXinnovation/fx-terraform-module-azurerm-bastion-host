###
# Bastion host
###

resource "azurerm_bastion_host" "this" {
  count = var.enabled ? length(var.bastion_host_names) : 0

  name                = element(var.bastion_host_names, count.index)
  location            = element(var.bastion_host_locations, count.index)
  resource_group_name = element(var.bastion_host_resource_group_names, count.index)

  dynamic "ip_configuration" {
    for_each = var.ip_configurations[count.index]

    content {
      name                 = ip_configuration.value.name
      subnet_id            = ip_configuration.value.subnet_id
      public_ip_address_id = ip_configuration.value.public_ip_address_id
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
