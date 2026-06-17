resource "google_compute_instance_template" "nginx" {
  name_prefix  = "nginx-template"
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

  tags = ["ssh"]
}

resource "google_compute_instance_group_manager" "nginx" {
  name               = "nginx-mig"
  base_instance_name = "nginx"
  zone               = "${var.region}-b"

  version {
    instance_template = google_compute_instance_template.nginx.id
  }

  target_size = 2

  named_port {
    name = "http"
    port = 80
  }
}