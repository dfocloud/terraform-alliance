resource "azurerm_managed_disk" "DataDisk" {
  count                = "${var.VMCount}"
  name                 = "${var.VMName}${format("%1d", count.index+1)}-data-disk"
  location             = "${var.VMLocation}"
  resource_group_name  = "${var.RG4VM}"
  storage_account_type = "${var.data_disk_type}"
  create_option        = "${var.data_disk_create_option}"
  disk_size_gb         = "${var.data_disk_size}"
  depends_on           = ["azurerm_virtual_machine.VM"]

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "DataDiskAttach" {
  count              = "${var.VMCount}"
  virtual_machine_id = "${element(azurerm_virtual_machine.VM.*.id, count.index)}"
  managed_disk_id    = "${element(azurerm_managed_disk.DataDisk.*.id, count.index)}"
  lun                = "${0+count.index}"
  caching            = "${var.data_disk_caching}"
  depends_on         = ["azurerm_managed_disk.DataDisk"]

  provisioner "local-exec" {
    command = "ansible-playbook --ssh-extra-args='-o StrictHostKeyChecking=no'  ansible4tf/datadisk-ansible.yml"
  }
}
