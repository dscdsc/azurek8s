resource "azurerm_linux_virtual_machine" "k8sMaster" {
    name                = "k8smaster"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = "k8s"
    network_interface_ids = [ azurerm_network_interface.myPublicIp1.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "k8s"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}

resource "azurerm_linux_virtual_machine" "k8sWorker1" {
    name                = "k8sworker01"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = "k8s"
    network_interface_ids = [ azurerm_network_interface.myPublicIp2.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "k8s"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}

resource "azurerm_linux_virtual_machine" "k8sWorker2" {
    name                = "k8sworker02"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = "k8s"
    network_interface_ids = [ azurerm_network_interface.myPublicIp3.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "k8s"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}