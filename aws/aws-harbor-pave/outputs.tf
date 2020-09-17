output "harbor_domain" {
  value = aws_route53_record.harbor_dns.name
}

output "harbor_lb_security_group_id" {
  value = aws_security_group.harbor_lb_security_group.id
}

output "harbor_web_lb_name" {
  value = aws_lb.harbor.name
}