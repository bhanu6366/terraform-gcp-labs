resource "google_compute_instance" "vm" {
  name         = "${local.resource_prefix}-vm"
  machine_type = "e2-micro"
  zone         = "${var.region}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
    }
  }

  metadata_startup_script = file("${path.module}/scripts/startup.sh")

  tags = ["ssh", "http"]

  labels = merge(
    var.common_labels,
    {
      name        = "compute-vm"
      environment = var.environment
    }
  )

  service_account {
    email  = google_service_account.compute_instance.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}