
locals {
  ops_manager_image_uri = "https://opsmanagerwestus.blob.core.windows.net/images/ops-manager-${var.opsman_version}-build.${var.opsman-build}.vhd"
}

resource "azurerm_storage_blob" "ops_manager_image" {
  name = "opsman.vhd"
  //resource_group_name    = azurerm_resource_group.platform.name
  storage_account_name   = var.ops_manager_storage_account_name
  storage_container_name = ops_manager_storage_container_name
  source_uri             = local.ops_manager_image_uri
  type                   = "Page"
}

resource "azurerm_image" "ops_manager_image" {
  name                = "ops_manager_image"
  location            = var.location
  resource_group_name = var.resource_group_name

  os_disk {
    os_type  = "Linux"
    os_state = "Generalized"
    blob_uri = azurerm_storage_blob.ops_manager_image.url
    size_gb  = 150
  }
}

data "azurerm_network_security_group" "ops_manager_security_group" {
  name                = var.ops_manager_security_group_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "ops_manager_nic" {
  name                      = "${var.environment_name}-ops-manager-nic"
  location                  = var.location
  resource_group_name       = var.resource_group_name

  network_security_group_id = data.azurerm_network_security_group.ops_manager_security_group.id


  ip_configuration {
    name                          = "${var.environment_name}-ops-manager-ip-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "static"
    private_ip_address            = var.ops_manager_private_ip
    public_ip_address_id          = var.ops_manager_public_ip_id
  }
}

resource "azurerm_virtual_machine" "ops_manager_vm" {
  name                          = "${var.environment_name}-ops-manager-vm"
  depends_on                    = [azurerm_network_interface.ops_manager_nic]
  location                      = var.location
  resource_group_name           = var.resource_group_name
  network_interface_ids         = [azurerm_network_interface.ops_manager_nic.id]
  vm_size                       = var.ops_manager_instance_type
  delete_os_disk_on_termination = "true"

  storage_image_reference {
    id = azurerm_image.ops_manager_image.id
  }

  storage_os_disk {
    name              = "opsman-disk.vhd"
    caching           = "ReadWrite"
    os_type           = "linux"
    create_option     = "FromImage"
    disk_size_gb      = "150"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "${var.environment_name}-ops-manager"
    admin_username = "ubuntu"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/ubuntu/.ssh/authorized_keys"
      key_data = var.ops_manager_ssh_public_key
    }
  }
}

