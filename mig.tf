resource "google_compute_instance_template" "nginx" {
  name_prefix  = "${local.resource_prefix}-nginx-template"
  machine_type = "e2-micro"

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {}
  }

  metadata_startup_script = file("${path.module}/scripts/startup.sh")

  tags = ["ssh", "http"]

  service_account {
    email  = google_service_account.compute_instance.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_compute_instance_group_manager" "nginx" {
  name               = "${local.resource_prefix}-nginx-mig"
  base_instance_name = "${local.resource_prefix}-nginx"
  zone               = "${var.region}-b"

  version {
    instance_template = google_compute_instance_template.nginx.id
  }

  target_size = 2

  named_port {
    name = "http"
    port = 80
  }

  named_port {
    name = "https"
    port = 443
  }
}