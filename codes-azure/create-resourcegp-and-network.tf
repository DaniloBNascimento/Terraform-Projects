provider "azurerm" {
version = "=1.28.0"  
}
resource "azurerm_resource_group" "az-test-rg" {
  name  =   "test-rg"
  location = "brazilsouth"  
}

resource "azurerm_virtual_network" "az-test-rg" {
  name  =   "test-rg-network"
  resource_group_name   =   "${azurerm_resource_group.az-test-rg.name}"
  location  =   "${azurerm_resource_group.az-test-rg.location}"
  address_space =   ["10.0.0.0/16"]
  
}