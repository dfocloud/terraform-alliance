# Variable definitions for subscription and authentication

variable azure_subscription_id {
  type = "string"
}

variable azure_client_id {
  type = "string"
}

variable azure_client_secret {
  type = "string"
}

variable azure_tenant_id {
  type = "string"
}

# Variable definitions for resource tagging

variable project_name {
  description = "Name of the project."
  default     = "cloud-core"
}

variable rc_id {
  description = "."
  default     = "77J00-527-284-4808-96213-6"
}

variable contact_name {
  description = "Name of the client contact person."
  default     = "Asghar Ghori"
}

# Variable definitions for resource group, location, and availability set 

variable RG4VM {
  description = "Name of the resource group to creat this VM in."
  default     = "Terraform-RG"
}

variable VMLocation {
  description = "Name of the Azure region to create this infrastructure in."
  default     = "Canada East"
}

variable AvailSet {
  description = "Name of the new or an existing availability set to add this VM to."
  default     = "terraform-dev-avs"
}

# Variable definitions for vnet, subnet, and NSG

variable VNET-RG {
  description = "Name of the existing resource group where the virtual network resides."
  default     = "Network-RG"
}

variable Vnet {
  description = "Name of the virtual network."
  default     = "DEV-CAE-VNET"
}

variable Subnet {
  description = "Name of the subnet."
  default     = "PAZ1"
}

variable NSG-RG {
  description = "Name of the existing resource group where the NSG resides."
  default     = "Network-RG"
}

variable NSG-Name {
  description = "Name of the NSG to be assigned to the VM."
  default     = "dfo-only-nsg"
}

# Variable definitions for virtual machine

variable VMName {
  description = "Computer name for the VM."
  default     = "terraform-dev-vm"
}

variable VMSize {
  description = "Defines the VM size."
  default     = "standard_DS1_v2"
}

variable VMCount {
  description = "Defines the number of VMs to be provisioned."
  default     = "1"
}

variable AdminUser {
  description = "Admin user name"
  default     = "linuxadm"
}

# Variable definitions for OS disk

variable os_disk_type {
  description = "Type of the OS disk."
  default     = "Premium_LRS"
}

variable os_disk_size {
  description = "Size in GBs for the OS disk."
  default     = "30"
}

variable os_disk_caching {
  description = "Whether the OS disk will be read-only or writable."
  default     = "ReadWrite"
}

variable os_disk_create_option {
  description = "Create OS disk during OS installation (FromImage). The other option is to attach an existing OS disk."
  default     = "FromImage"
}

variable os_disk_delete {
  description = "With the removal of the VM, would you like the OS disk removed along with its data? Choices are true and false."
  default     = "true"
}

# Variable definitions for Ubuntu image to be installed in the VM

#variable os_publisher {
#description = "Name of the guest Ubuntu image to be installed in the VM."
#default     = "Canonical"
#}

#variable os_offer {
#default = "UbuntuServer"
#}

#variable os_sku {
#default = "18.04-LTS"
#}

#variable os_version {
#default = "latest"
#}

# Variable definitions for CentOS image to be installed in the VM

variable os_publisher {
  description = "Name of the guest CentOS image to be installed in the VM."
  default     = "OpenLogic"
}

variable os_offer {
  default = "CentOS"
}

variable os_sku {
  default = "7.4"
}

variable os_version {
  default = "latest"
}

# Variable definitions for boot diagnostics and diagnostic settings

variable boot_diag {
  description = "Enable boot diagnostics?"
  default     = "true"
}

variable boot_diag_URI {
  description = "URI for the diagnostic storage account to log VM boot diagnostic messages. Enabling this will allow console access."
  default     = "https://commonrgdiag.blob.core.windows.net"
}

variable law_id_rg {
  description = "Resource group for the log analytics workspace to store log and metric data."

  #default     = "56731199-9241-4071-a01f-c2ac28a44de7"
  default = "Common-RG"
}

variable law_id_name {
  description = "Name for the log analytics workspace."
  default     = "MGMT-DEV-LOGS"
}

# Variable definitions for data disks

variable data_disk_type {
  description = "Type of the data disk."
  default     = "Premium_LRS"
}

variable data_disk_size {
  description = "Size in GBs for the data disk."
  default     = "10"
}

variable data_disk_caching {
  description = "Whether the data disk will be read-only or writable."
  default     = "ReadWrite"
}

variable data_disk_create_option {
  description = "Create an empty data disk. Other options are copy an existing data disk/snapshot, import an existing VHD file, and copy an image."
  default     = "Empty"
}

variable data_disk_delete {
  description = "With the removal of the VM, would you like all data disks removed along with their data? Choices are true and false."
  default     = "true"
}

# Variable definitions for role assignments

variable role_id1 {
  description = "VM User Access role ID to allow the assignee to be able to log in to th VM. This value has to be a GUID."
  default     = "fb879df8-f326-4884-b1cf-06f3ad86be52"
}

variable role_id2 {
  description = "VM Administrator Login role ID to allow the assignee to be able to run Linux privileged commands as root. This value has to be a GUID."
  default     = "1c0163c0-47e6-4577-8991-ea5c82e286e4"
}

variable role_id3 {
  description = "DFO VM Operator role ID to allow the assignee to be able to stop, start, and restart the VM. This value has to be a GUID."
  default     = "ad997794-515d-4c3a-87ef-e546e750e313"
}

variable role_assignee1 {
  description = "ID of the Azure AD user or group to assign a role to. This value has to be a GUID."
  default     = "7fb2389e-9a0b-485e-a32e-0d714df5feb3"
}

# Variable definitions for extensions

variable AADVer {
  description = "Version of the Azure Active Directory extension to be installed"
  default     = "1.0"
}

variable LinuxDiagVer {
  description = "Version of the Linux Diagnostics extension to be installed"
  default     = "2.3"
}

variable NetWatcherVer {
  description = "Version of the Network Watcher extension to be installed"
  default     = "1.4"
}

# Variable definitions for SSH keys

variable priv_key {
  description = "SSH private key location and file name on Terraform server."
  default     = "/home/linuxadm/.ssh/id_rsa"
}

variable pub_key {
  description = "SSH public key location and file name on Terraform server."
  default     = "/home/linuxadm/.ssh/id_rsa.pub"
}

variable dest_loc {
  description = "SSH public key destination location and file name."
  default     = "/home/linuxadm/.ssh/authorized_keys"
}
