
resource "azurerm_network_security_group" "masterSecGroup" {
    name                = "masterports"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "ListPorts"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges     = [22,80,443,6443]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}

resource "azurerm_network_interface_security_group_association" "masterSecGroupAssociation" {
    network_interface_id      = azurerm_network_interface.myPublicIp1.id
    network_security_group_id = azurerm_network_security_group.masterSecGroup.id

}

resource "azurerm_network_security_group" "worker1SecGroup" {
    name                = "worker1ports"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges     = [22,6443]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}

resource "azurerm_network_interface_security_group_association" "worker1SecGroupAssociation" {
    network_interface_id      = azurerm_network_interface.myPublicIp2.id
    network_security_group_id = azurerm_network_security_group.worker1SecGroup.id

}

resource "azurerm_network_security_group" "worker2SecGroup" {
    name                = "worker2ports"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = [22,6443]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}

resource "azurerm_network_interface_security_group_association" "worker2SecGroupAssociation" {
    network_interface_id      = azurerm_network_interface.myPublicIp3.id
    network_security_group_id = azurerm_network_security_group.worker2SecGroup.id

}