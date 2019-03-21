resource "azurerm_resource_group" "ResourceGroup" {
  name     = "${var.RG4VM}"
  location = "${var.VMLocation}"

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }
}
