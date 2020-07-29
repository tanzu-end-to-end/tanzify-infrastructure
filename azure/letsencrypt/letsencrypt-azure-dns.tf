provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"

  version = "~> 1.2.0"
}


resource "azurerm_resource_group" "resource_group" {
  name     = "${var.environment_name}"
  location = "${var.location}"
}

locals {
  dns_subdomain = "${var.environment_name}"
}

resource "azurerm_dns_zone" "env_dns_zone" {
  name                = "${var.hosted_zone != "" ? var.hosted_zone : local.dns_subdomain}.${var.environment_name}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
}

# Test if the DNS name is registered with Azure DNS
data "azurerm_dns_zone" "hosted" {
  name = var.hosted_zone
}

resource "azurerm_dns_ns_record" "test" {
  name                = var.hosted_zone
  zone_name           = data.azurerm_dns_zone.hosted.name
  resource_group_name = data.azurerm_dns_zone.hosted.resource_group_name

  ttl = 300

  records = [
    list(azurerm_dns_zone.env_dns_zone.name_servers),
  ]
}

locals {
  base_domain = "${var.environment_name}.${var.hosted_zone}"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "none@tanzify.org" # Dummy email address
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = local.base_domain
  subject_alternative_names = [ "opsmanager.${local.base_domain}",
                                "*.apps.${local.base_domain}",
                                "*.sys.${local.base_domain}",
                                "*.uaa.sys.${local.base_domain}",
                                "*.login.sys.${local.base_domain}",
                                "*.pks.${local.base_domain}"]

  dns_challenge {
    provider = "azure"

    config = {
      AZURE_CLIENT_ID       = var.client_id
      AZURE_CLIENT_SECRET   = var.client_secret
      AZURE_SUBSCRIPTION_ID = var.subscription_id
      AZURE_TENANT_ID       = var.tenant_id
      AZURE_RESOURCE_GROUP  = var.environment_name
    }
  }

  depends_on = [azurerm_dns_ns_record.test]
}

locals {
  cert_full_chain = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
  cert_key        = "${acme_certificate.certificate.private_key_pem}"
}
