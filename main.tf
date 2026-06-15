resource "google_storage_bucket" "tf_lab" {
  name          = var.bucket_name
  location      = var.bucket_location
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    environment = var.environment
    owner       = "bhavani"
  }
}