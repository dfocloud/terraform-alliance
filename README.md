# This README.md file describes the Terraform files that are used to build a VM infrastructure in Azure. Currently, all Terraform files are located under the /home/linuxadm/Automation/Terraform/test directory on linuxjumpserver01.

# There are several files under "test" Terraform will use to provision an IaaS VM. These files may be grouped into three categories: (1) Variable declarations and definitions, (2) Terraform code, and (3) Output. Here is a brief description of each file in each category:

   # (1) Variable Declarations and Definitions: Three files define the variable values Terraform will use during infrastructure provisioning:

        # (1.1) terraform.tfvars: defines the subscription ID, client ID, client secret, and tenant ID variable values. You need to replace the subscription ID with the subscription ID where you want the provisioning to take place. This file is protected from being synced with git repos.
        # (1.2) provider.tf: declares the variables for subscription ID, client ID, client secret, and tenant ID.
        # (1.3) variables.tf: defines values for all the variables Terraform requires to build the infrastructure. These values are referenced by all .tf files. Any change required in any of the resource being built needs to be set in this file.

   # (2) Terraform Code: The following files contain the code Terraform will use to build the desired infrastructure. These files must have .tf extension.

        # (2.1) availabilityset.tf: Creates an availability set for the VM.
        # (2.2) datadisk.tf: Creates a data disk and attaches it to the VM. This file also includes a set of tasks to format the data disk and mount it on a desired mount point.  This file should be renamed to datadisk.tf.bak if a data disk is not required.
        # (2.3) extensions.tf: Installs three extensions that will allow users to be able to log in to the VM with Azure AD credentials, end nable Linux diagnostics and Network Watcher.
        # (2.4) networkinterface.tf: Creates a network interface card for the VM with a dynamic private IP address. Comment out the line "public_ip_address_id" if public IP is not desired.
        # (2.5) pip.tf: Creates a public IP address Terraform will assign to the network interface card if "public_ip_address_id" is uncommented in the networkinterface.tf file. Rename this file to pip.tf.bak if a public IP is not required.
        # (2.6) resourcegroups.tf: Defines the resource group Terraform will create to encapsulate this infrastructure.
        # (2.7) roles.tf: Lists role assignments and principal IDs of the assignees (Azure AD users and/or groups). Rename this file to roles.tf.bak if role assginments are not desired.
        # (2.8) virtualmachine-linux.tf: All information required to build the VM goes in this file. This file includes details for the OS disk, OS image, OS profile, SSH key location, boot diagnostics location, etc. There is a block of commands at the end Terraform will execute after the VM has been built. These Linux commands will apply the latest Linux patches, enable and activate the Network Time Protocol service, set a default timeout value, etc.

   # (3) Output:

        # (3.1) outputs.tf: Can be used to display public IP, private IP, or other information after the deployment has ended.

