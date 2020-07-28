

resource "azurerm_image" "ops_manager_image" {
  name                = "ops_manager_image"
  location            = var.location
  resource_group_name = "${var.resource_group_name}"
  count               = "${local.ops_man_vm}"

  os_disk {
    os_type  = "Linux"
    os_state = "Generalized"
    blob_uri = "${azurerm_storage_blob.ops_manager_image.url}"
    size_gb  = 150
  }
}

resource "azurerm_network_interface" "ops_manager_nic" {
  name                      = "${var.environment_name}-ops-manager-nic"
  depends_on                = ["azurerm_public_ip.ops_manager_public_ip"]
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  network_security_group_id = "${var.security_group_id}"
  count                     = "${local.ops_man_vm}"

  ip_configuration {
    name                          = "${var.environment_name}-ops-manager-ip-config"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "static"
    private_ip_address            = "${var.ops_manager_private_ip}"
    public_ip_address_id          = "${azurerm_public_ip.ops_manager_public_ip.id}"
  }
}

resource "azurerm_virtual_machine" "ops_manager_vm" {
  name                          = "${var.environment_name}-ops-manager-vm"
  depends_on                    = ["azurerm_network_interface.ops_manager_nic"]
  location                      = "${var.location}"
  resource_group_name           = "${var.resource_group_name}"
  network_interface_ids         = ["${azurerm_network_interface.ops_manager_nic.id}"]
  vm_size                       = "${var.ops_manager_vm_size}"
  delete_os_disk_on_termination = "true"
  count                         = "${local.ops_man_vm}"

  storage_image_reference {
    id = "${azurerm_image.ops_manager_image.id}"
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
      key_data = "${tls_private_key.ops_manager.public_key_openssh}"
    }
  }
}

