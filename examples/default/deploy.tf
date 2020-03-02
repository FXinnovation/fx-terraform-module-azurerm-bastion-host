resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = "tftest${random_string.this.result}"
  location = "West US"
}

resource "azurerm_virtual_network" "example" {
  name                = "tf${random_string.this.result}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefix       = "10.0.1.0/24"
}

module "example" {
  source = "../.."

  public_ip_enabled                = true
  public_ip_name                   = "boo${random_string.this.result}"
  public_ip_location               = azurerm_resource_group.example.location
  public_ip_resource_group_name    = azurerm_resource_group.example.name
  public_ip_allocation_method      = "Static"
  public_ip_sku                    = "Standard"
  bastion_host_name                = "foo${random_string.this.result}"
  bastion_host_location            = "West US"
  bastion_host_resource_group_name = "${azurerm_resource_group.example.name}"

  ip_configurations = [
    { name = "boo${random_string.this.result}", subnet_id = "${azurerm_subnet.example.id}" }
  ]
}
