terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}
provider "azurerm"{
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "ghouse1"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    access_key = "8Sk3TirD+9mMG/BOmDT7xPVMQW/XarvjSGeYO8ak5f5L9x6Ed8R8RQ17FgpCDShbyIJZqUPaOULS+ASt1H18RA=="
  }
}


resource "azurerm_resource_group" "ghouse" {
  name     = "${var.rgname}"
  location = "${var.rglocation}"
}

resource "azurerm_network_security_group" "example" {
  name                = "${var.nsgname}"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.ventname}"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}" 
}

resource "azurerm_subnet" "example" {
  name                 = "${var.subnetname}"
  resource_group_name  = "${var.rgname}"
  virtual_network_name = "${var.ventname}"
  address_prefixes     = ["10.0.1.0/24"]
}