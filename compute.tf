resource "google_compute_instance" "vm" {
  name         = "devops-vm"
  machine_type = "e2-micro"
  zone         = "${var.region}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
    }
  }

  tags = ["ssh"]
}