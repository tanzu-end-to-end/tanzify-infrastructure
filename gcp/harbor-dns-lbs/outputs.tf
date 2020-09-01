output "harbor_domain" {
  value = trimsuffix(google_dns_record_set.harbor_dns.name,".")
}

output "harbor_web_lb_name" {
  value = google_compute_address.harbor_lb.name
}