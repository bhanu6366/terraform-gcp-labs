resource "google_compute_health_check" "nginx" {
  name = "${local.resource_prefix}-nginx-health-check"

  http_health_check {
    port = 80
  }
}

resource "google_compute_instance_group" "nginx_group" {
  name = "${local.resource_prefix}-nginx-group"
  zone = "${var.region}-b"

  instances = [
    google_compute_instance.vm.self_link
  ]

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_backend_service" "nginx" {
  name                  = "${local.resource_prefix}-nginx-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL"

  port_name = "http"

  health_checks = [
    google_compute_health_check.nginx.id
  ]

  backend {
    group = google_compute_instance_group_manager.nginx.instance_group
  }
}

resource "google_compute_url_map" "nginx" {
  name            = "${local.resource_prefix}-nginx-url-map"
  default_service = google_compute_backend_service.nginx.id
}

resource "google_compute_target_http_proxy" "nginx" {
  name    = "${local.resource_prefix}-nginx-http-proxy"
  url_map = google_compute_url_map.nginx.id
}

resource "google_compute_global_address" "nginx" {
  name = "${local.resource_prefix}-nginx-lb-ip"
}

resource "google_compute_global_forwarding_rule" "nginx" {
  name                  = "${local.resource_prefix}-nginx-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.nginx.id
  ip_address            = google_compute_global_address.nginx.address
}