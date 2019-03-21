output "Availability Set" {
  value = "${azurerm_availability_set.AvailabilitySet.name}"
}

output "Resource Group" {
  value = "${azurerm_resource_group.ResourceGroup.name}"
}

output "Virtual Machines" {
  value = "${azurerm_virtual_machine.VM.*.name}"
}

output "Private_IP_Addresses" {
  value = "${azurerm_network_interface.nic.*.private_ip_addresses}"
}

output "Data Disk Names" {
  value = "${azurerm_managed_disk.DataDisk.*.name}"
}

output "Network Interface Cards" {
  value = "${azurerm_network_interface.nic.*.name}"
}

output "Role 'VM User Access' assigned to" {
  value = "${azurerm_role_assignment.RoleAssignment1.principal_id}"
}

output "Role 'VM Administrator Login' assigned to" {
  value = "${azurerm_role_assignment.RoleAssignment2.principal_id}"
}

output "Role 'DFO VM Operator' assigned to" {
  value = "${azurerm_role_assignment.RoleAssignment3.principal_id}"
}
