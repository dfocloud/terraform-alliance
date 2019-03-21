resource "azurerm_role_assignment" "RoleAssignment1" {
  scope              = "/subscriptions/${var.azure_subscription_id}/resourceGroups/${var.RG4VM}"
  role_definition_id = "/subscriptions/${var.azure_subscription_id}/providers/Microsoft.Authorization/roleDefinitions/${var.role_id1}"
  principal_id       = "${var.role_assignee1}"

  depends_on = ["azurerm_virtual_machine.VM"]
}

resource "azurerm_role_assignment" "RoleAssignment2" {
  scope              = "/subscriptions/${var.azure_subscription_id}/resourceGroups/${var.RG4VM}"
  role_definition_id = "/subscriptions/${var.azure_subscription_id}/providers/Microsoft.Authorization/roleDefinitions/${var.role_id2}"
  principal_id       = "${var.role_assignee1}"

  depends_on = ["azurerm_virtual_machine.VM"]
}

resource "azurerm_role_assignment" "RoleAssignment3" {
  scope              = "/subscriptions/${var.azure_subscription_id}/resourceGroups/${var.RG4VM}"
  role_definition_id = "/subscriptions/${var.azure_subscription_id}/providers/Microsoft.Authorization/roleDefinitions/${var.role_id3}"
  principal_id       = "${var.role_assignee1}"

  depends_on = ["azurerm_virtual_machine.VM"]
}
