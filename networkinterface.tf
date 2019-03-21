data "azurerm_subnet" "Subnet" {
  name                 = "${var.Subnet}"
  virtual_network_name = "${var.Vnet}"
  resource_group_name  = "${var.VNET-RG}"
}

data "azurerm_network_security_group" "NSG" {
  name                = "${var.NSG-Name}"
  resource_group_name = "${var.NSG-RG}"
}

resource "azurerm_network_interface" "nic" {
  count = "${var.VMCount}"
  name  = "${var.VMName}${format("%1d", count.index+1)}-nic"

  location            = "${var.VMLocation}"
  resource_group_name = "${var.RG4VM}"
  depends_on          = ["azurerm_resource_group.ResourceGroup"]

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }

  network_security_group_id = "${data.azurerm_network_security_group.NSG.id}"

  ip_configuration {
    name                          = "${var.VMName}${format("%1d", count.index+1)}-ip"
    subnet_id                     = "${data.azurerm_subnet.Subnet.id}"
    private_ip_address_allocation = "Dynamic"
  }
}
