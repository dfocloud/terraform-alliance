resource "azurerm_virtual_machine_extension" "AADLoginForLinux" {
  count                      = "${var.VMCount}"
  name                       = "AADLoginForLinux"
  location                   = "${var.VMLocation}"
  resource_group_name        = "${var.RG4VM}"
  virtual_machine_name       = "${var.VMName}${format("%1d", count.index+1)}"
  publisher                  = "Microsoft.Azure.ActiveDirectory.LinuxSSH"
  type                       = "AADLoginForLinux"
  type_handler_version       = "${var.AADVer}"
  auto_upgrade_minor_version = "true"

  depends_on = ["azurerm_virtual_machine.VM"]

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }
}

resource "azurerm_virtual_machine_extension" "LinuxDiagnostic" {
  count                      = "${var.VMCount}"
  name                       = "LinuxDiagnostic"
  location                   = "${var.VMLocation}"
  resource_group_name        = "${var.RG4VM}"
  virtual_machine_name       = "${var.VMName}${format("%1d", count.index+1)}"
  publisher                  = "Microsoft.OSTCExtensions"
  type                       = "LinuxDiagnostic"
  type_handler_version       = "${var.LinuxDiagVer}"
  auto_upgrade_minor_version = "true"

  depends_on = ["azurerm_virtual_machine.VM"]

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }
}

resource "azurerm_virtual_machine_extension" "NetworkWatcher" {
  count                      = "${var.VMCount}"
  name                       = "NetworkWatcherAgentLinux"
  location                   = "${var.VMLocation}"
  resource_group_name        = "${var.RG4VM}"
  virtual_machine_name       = "${var.VMName}${format("%1d", count.index+1)}"
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "${var.NetWatcherVer}"
  auto_upgrade_minor_version = "true"

  depends_on = ["azurerm_virtual_machine.VM"]

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }
}
