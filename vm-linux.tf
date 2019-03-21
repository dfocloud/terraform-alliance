#resource "ansible_host" "terraform-dev-hosts" {
#count              = "${var.VMCount}"
#inventory_hostname = "${element(azurerm_network_interface.nic.*.id, count.index)}"
#}

resource "azurerm_virtual_machine" "VM" {
  count                         = "${var.VMCount}"
  name                          = "${var.VMName}${format("%1d", count.index+1)}"
  location                      = "${var.VMLocation}"
  resource_group_name           = "${var.RG4VM}"
  network_interface_ids         = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
  delete_os_disk_on_termination = "${var.os_disk_delete}"

  delete_data_disks_on_termination = "${var.data_disk_delete}"
  vm_size                          = "${var.VMSize}"

  availability_set_id = "${azurerm_availability_set.AvailabilitySet.id}"
  depends_on          = ["azurerm_availability_set.AvailabilitySet"]

  tags {
    project = "${var.project_name}"
    rc      = "${var.rc_id}"
    contact = "${var.contact_name}"
  }

  storage_os_disk {
    name              = "${var.VMName}${format("%1d", count.index+1)}-os-disk"
    caching           = "${var.os_disk_caching}"
    create_option     = "${var.os_disk_create_option}"
    managed_disk_type = "${var.os_disk_type}"
    disk_size_gb      = "${var.os_disk_size}"
  }

  storage_image_reference {
    publisher = "${var.os_publisher}"
    offer     = "${var.os_offer}"
    sku       = "${var.os_sku}"
    version   = "${var.os_version}"
  }

  os_profile {
    computer_name  = "${var.VMName}${format("%1d", count.index+1)}"
    admin_username = "${var.AdminUser}"
  }

  os_profile_linux_config {
    disable_password_authentication = "true"

    ssh_keys {
      path     = "${var.dest_loc}"
      key_data = "${file(var.pub_key)}"
    }
  }

  boot_diagnostics {
    enabled     = "${var.boot_diag}"
    storage_uri = "${var.boot_diag_URI}"
  }

  #provisioner "local-exec" {
    #command = "grep private_ip_address terraform.tfstate |grep 100 | awk '{print $2}'|uniq|sed -e 's/,$//' -e 's/\"//g' > ansible4tf/ansible-private-ips && grep nic terraform.tfstate|awk '{print $2}' |sort | uniq | sed -e 's/\"//g' -e 's/-nic,$//g'| grep -v subscriptions |grep vm > ansible4tf/ansible-host-names && paste ansible4tf/ansible-private-ips ansible4tf/ansible-host-names | sudo tee -a /etc/hosts"
#command = "ansible -i azurerm_ansible.py terraform-rg "
  #}

  #provisioner "local-exec" {
    #command = "ansible-playbook --ssh-extra-args='-o StrictHostKeyChecking=no' -i ansible4tf/ansible-host-names ansible4tf/vm-linux-ansible-provisioner.yml"
  #}
}
