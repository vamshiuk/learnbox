terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = "92188267-c5ce-4408-98c4-ae56f4a7fff3"
  client_secret   = "-rG8Q~bqva_3fB7PYuc7yPRc3K3Xy6WnCzyUKa7n"
  tenant_id       = "49b10e86-14cc-4b21-b2c1-5c7e84654055"
  subscription_id = "b240893f-588d-4930-a4eb-98679d99989f"

}

resource "azurerm_resource_group" "RG1" {
  name     = "${var.rgname}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "Vnet1" {
  name                = "${var.vnetname}"
  address_space       = ["${var.vnet_cidr_prefix}"]
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.prefix1}"
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.Vnet1.name
  address_prefixes     = ["${var.vnet_cidr_prefix2}"]
}
