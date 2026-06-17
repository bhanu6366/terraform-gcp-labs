resource "google_compute_instance" "vm" {
  name         = "devops-vm"
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

  tags = ["ssh"]
}