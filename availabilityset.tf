resource "azurerm_availability_set" "AvailabilitySet" {
  name                        = "${var.AvailSet}"
  location                    = "${var.VMLocation}"
  resource_group_name         = "${var.RG4VM}"
  platform_fault_domain_count = 2
  managed                     = true
  depends_on                  = ["azurerm_resource_group.ResourceGroup"]

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }
}
