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
  name                 = "tftest${random_string.this.result}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_public_ip" "example" {
  name                = "boo${random_string.this.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

module "example" {
  source = "../.."

  bastion_host_names               = ["foo${random_string.this.result}"]
  bastion_host_location            = ["West US"]
  bastion_host_resource_group_name = ["${azurerm_resource_group.example.name}"]

  ip_configurations = [
    [
      { name = "boo${random_string.this.result}", subnet_id = "${azurerm_subnet.example.id}", public_ip_address_id = "${azurerm_public_ip.example.id}" }
    ]
  ]
}
