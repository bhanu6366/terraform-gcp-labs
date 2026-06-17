output "bucket_name" {
  value = google_storage_bucket.tf_lab.name
}

output "bucket_url" {
  value = google_storage_bucket.tf_lab.url
}
output "lb_ip" {
  value = google_compute_global_address.nginx.address
}