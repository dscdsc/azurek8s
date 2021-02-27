## Definimos en qué tipo de red estarán las VMS alojadas

resource "azurerm_virtual_network" "myNet" {
    name                = "k8snet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    tags = {
        environment = "CP2"
    }
}

## Definimos la subred que tendrá las nics configurada

resource "azurerm_subnet" "mySubnet" {
    name                   = "k8subnet"
    resource_group_name    = azurerm_resource_group.rg.name
    virtual_network_name   = azurerm_virtual_network.myNet.name
    address_prefixes       = ["10.0.1.0/24"]

}

## IP Privada alojada en k8smaster

resource "azurerm_network_interface" "myPublicIp1" {
  name                = "vmnic1"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.myPublicIp1.id
  }

    tags = {
        environment = "CP2"
    }

}

## IP Privada alojada en k8sworker01

resource "azurerm_network_interface" "myPublicIp2" {
  name                = "vmnic2"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.11"
    public_ip_address_id           = azurerm_public_ip.myPublicIp2.id
  }

    tags = {
        environment = "CP2"
    }

}

## IP Privada alojada en k8sworker02

resource "azurerm_network_interface" "myPublicIp3" {
  name                = "vmnic3"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.12"
    public_ip_address_id           = azurerm_public_ip.myPublicIp3.id
  }

    tags = {
        environment = "CP2"
    }

}

## IP Publica dinámica de k8smaster

resource "azurerm_public_ip" "myPublicIp1" {
  name                = "vmip1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}

## IP Publica dinámica de k8sworker01

resource "azurerm_public_ip" "myPublicIp2" {
  name                = "vmip2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}

## IP Publica dinámica de k8sworker02
resource "azurerm_public_ip" "myPublicIp3" {
  name                = "vmip3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}