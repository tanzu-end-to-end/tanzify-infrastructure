data "template_file" "om_configuration" {
  template = chomp(file("${path.module}/templates/opsman_config.yml"))

  vars {
    az = "${var.azs[0]}"
  }
}

data "template_file" "om_management_subnets" {
  template = chomp(file("${path.module}/templates/opsman_subnet_config.yml"))

  vars {
    id = "${var.azure_network_name}/${var.azure_management_subnet_name}"
    dns = "168.63.129.16"
    cidr = var.azure_management_subnet_cidrs[0]
    gateway = var.azure_management_subnet_gateway
    reserved = "${cidrhost(var.azure_management_subnet_cidrs[0], 0) }-${cidrhost(var.azure_management_subnet_cidrs[0], 9) }"
  }
}

data "template_file" "om_pas_subnets" {
  template = chomp(file("${path.module}/templates/opsman_subnet_config.yml"))

  vars {
    id = "${var.azure_network_name}/${var.azure_pas_subnet_name}"
    dns = "168.63.129.16"
    cidr = var.azure_pas_subnet_cidrs[0]
    gateway = var.azure_pas_subnet_gateway
    reserved = "${cidrhost(var.azure_pas_subnet_cidrs[0], 0) }-${cidrhost(var.azure_pas_subnet_cidrs[0], 9) }"
  }
}

data "template_file" "om_services_subnets" {
  template = chomp(file("${path.module}/templates/opsman_subnet_config.yml"))

  vars {
    id = "${var.azure_network_name}/${var.azure_services_subnet_name}"
    dns = "168.63.129.16"
    cidr = var.azure_services_subnet_cidrs[0]
    gateway = var.azure_services_subnet_gateway
    reserved = "${cidrhost(var.azure_services_subnet_cidrs[0], 0) }-${cidrhost(var.azure_services_subnet_cidrs[0], 9) }"
  }
}

locals {
  ssh_private_key_encoded = jsonencode(var.ops_manager_ssh_private_key)
  ssh_public_key_encoded = jsonencode(var.ops_manager_ssh_public_key)
}


data "template_file" "om_configuration" {
  template = chomp(file("${path.module}/templates/opsman_config_ops.yml"))

  vars {
    management_subnets = join("\n", data.template_file.om_management_subnets.*.rendered)
    pas_subnets        = join("\n", data.template_file.om_pas_subnets.*.rendered)
    services_subnets   = join("\n", data.template_file.om_services_subnets.*.rendered)

    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    client_id       = var.client_id
    client_secret   = var.client_secret

    resource_group_name       = var.azure_pcf_resource_group_name
    bosh_storage_account_name = var.azure_bosh_root_storage_account
    ssh_public_key            = substr(local.ssh_public_key_encoded, 1, length(local.ssh_public_key_encoded)-2)
    ssh_private_key           = substr(local.ssh_private_key_encoded, 1, length(local.ssh_private_key_encoded)-2)
  }
}