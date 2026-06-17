resource "google_compute_autoscaler" "nginx" {
  name   = "nginx-autoscaler"
  zone   = "${var.region}-b"
  target = google_compute_instance_group_manager.nginx.id

  autoscaling_policy {
    min_replicas    = 2
    max_replicas    = 4
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}