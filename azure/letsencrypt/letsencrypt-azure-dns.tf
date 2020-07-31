
provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"

  version = "~> 1.2.0"
}

locals {
  base_domain = "${var.environment_name}.${var.hosted_zone}"
}

#Lookup the hosted zone in Azure for the domain
data "azurerm_dns_zone" "hosted_zone" {
  name = var.hosted_zone
}

#Lookup the NS records for the environment
data "dns_ns_record_set" "ns_records" {
  host = var.hosted_zone
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "none@tanzify.org" # Dummy email address
}

# Use DNS challenge to get TLS certificate for all the domains we need.
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
  depends_on = [data.dns_ns_record_set.ns_records]
}

locals {
  cert_full_chain = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
  cert_key        = "${acme_certificate.certificate.private_key_pem}"
}
