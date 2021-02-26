
resource "azurerm_network_security_group" "masterSecGroup" {
    name                = "sshtrfk8sm"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}


resource "azurerm_network_security_group" "masterHttpGroup" {
    name                = "httptrfk8sm"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}


resource "azurerm_network_security_group" "masterHttpsGroup" {
    name                = "httpstrfk8sm"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "HTTPS"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
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

resource "azurerm_network_interface_security_group_association" "masterHttpGroupAssociation" {
    network_interface_id      = azurerm_network_interface.myPublicIp1.id
    network_security_group_id = azurerm_network_security_group.masterHttpGroup.id

}

resource "azurerm_network_interface_security_group_association" "masterHttpsGroupAssociation" {
    network_interface_id      = azurerm_network_interface.myPublicIp1.id
    network_security_group_id = azurerm_network_security_group.masterHttpsGroup.id

}

resource "azurerm_network_security_group" "worker1SecGroup" {
    name                = "sshtrfk8sw1"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
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
    name                = "sshtrfk8sw2"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
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