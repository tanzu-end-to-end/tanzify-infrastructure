resource "google_compute_address" "harbor_lb" {
  name = "${var.environment_name}-harbor-lb"
}

resource "google_compute_forwarding_rule" "harbor_lb_80" {
  name        = "${var.environment_name}-harbor-lb-80"
  ip_address  = google_compute_address.harbor_lb.address
  target      = google_compute_target_pool.harbor_lb.self_link
  port_range  = "80"
  ip_protocol = "TCP"
}

resource "google_compute_forwarding_rule" "harbor_lb_443" {
  name        = "${var.environment_name}-harbor-lb-443"
  ip_address  = google_compute_address.harbor_lb.address
  target      = google_compute_target_pool.harbor_lb.self_link
  port_range  = "443"
  ip_protocol = "TCP"
}

resource "google_compute_target_pool" "harbor_lb" {
  name = "${var.environment_name}-harbor-lb"
}


resource "google_compute_firewall" "harbor_lb" {
  name    = "${var.environment_name}-harbor-lb-firewall"
  network = var.network_name

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = ["${var.environment_name}-harbor-lb"]
}
