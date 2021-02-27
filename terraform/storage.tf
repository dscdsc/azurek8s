## Creación de un segundo disco de el nodo k8smaster,
## para crear el cluster de rook-ceph

resource "azurerm_managed_disk" "k8sMasterDisk" {
  name                 = "k8smaster-disk1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 20
}

resource "azurerm_virtual_machine_data_disk_attachment" "k8sMasterAttach" {
  managed_disk_id    = azurerm_managed_disk.k8sMasterDisk.id
  virtual_machine_id = azurerm_linux_virtual_machine.k8sMaster.id
  lun                = "10"
  caching            = "ReadWrite"
}

## Creación de un segundo disco de el nodo k8sworker01
## para crear el cluster de rook-ceph

resource "azurerm_managed_disk" "k8sWorker1Disk" {
  name                 = "k8sworker1-disk1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 20
}

resource "azurerm_virtual_machine_data_disk_attachment" "k8sWorker1Attach" {
  managed_disk_id    = azurerm_managed_disk.k8sWorker1Disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.k8sWorker1.id
  lun                = "10"
  caching            = "ReadWrite"
}

## Creación de un segundo disco de el nodo k8sworker01
## para crear el cluster de rook-ceph

resource "azurerm_managed_disk" "k8sWorker2Disk" {
  name                 = "k8sworker2-disk1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 20
}

resource "azurerm_virtual_machine_data_disk_attachment" "k8sWorker2Attach" {
  managed_disk_id    = azurerm_managed_disk.k8sWorker2Disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.k8sWorker2.id
  lun                = "10"
  caching            = "ReadWrite"
}