data "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone
}

resource "aws_route53_record" "harbor_dns" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "harbor.${var.environment_name}.${data.aws_route53_zone.hosted_zone.name}"
  type    = "A"

  alias {
    name                   = aws_lb.harbor.dns_name
    zone_id                = aws_lb.harbor.zone_id
    evaluate_target_health = true
  }
}
