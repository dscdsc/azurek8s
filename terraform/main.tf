terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

## Configuración de credenciales de Azure

provider "azurerm" {
  features {}
  subscription_id = "e8b5381e-607b-4ada-ba0a-31fbdf254f1d"
  client_id       = "adad347e-8fe3-48b3-94ae-16173e5d5cae"
  client_secret   = "W5kl-JWZJL5dB8PSyRg_xVZPx1QfJupKl-"
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440"
}

## Crear Grupo de recursos que contendrá todos los recursos, vms, nics, sotorages, etc..

resource "azurerm_resource_group" "rg" {
    name     =  "k8s_rg"
    location = var.location

    tags = {
        environment = "CP2"
    }

}

## Creando la cuneta de almacenamiento, que contendrá los discos de cada VM

resource "azurerm_storage_account" "stAccount" {
    name                     = "staccountcp2dsc" 
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CP2"
    }

}