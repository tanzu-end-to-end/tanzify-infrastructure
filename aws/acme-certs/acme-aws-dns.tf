
provider "acme" {
  server_url = var.acme_server_url
}

locals {
  base_domain = "${var.environment_name}.${var.hosted_zone}"
}

#Lookup the hosted zone in Azure for the domain
data "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone
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
  subject_alternative_names = formatlist("%s.%s", var.subject_alternative_names , local.base_domain)

  dns_challenge {
    provider = "route53"

    config = {
      AWS_HOSTED_ZONE_ID = data.aws_route53_zone.hosted_zone.id
    }
  }
}

locals {
  cert_full_chain = acme_certificate.certificate.certificate_pem
  cert_key        = acme_certificate.certificate.private_key_pem
  cert_ca         = acme_certificate.certificate.issuer_pem
}
