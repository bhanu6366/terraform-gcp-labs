resource "google_storage_bucket" "tf_lab" {
  name                        = var.bucket_name
  location                    = var.bucket_location
  force_destroy               = var.storage_force_destroy
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  labels = merge(
    var.common_labels,
    {
      name        = "lab-bucket"
      environment = var.environment
    }
  )
}