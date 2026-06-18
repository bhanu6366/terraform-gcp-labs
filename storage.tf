resource "google_storage_bucket" "terraform_state" {
  name                        = "bhanu6366-tf-state"
  location                    = "EU"
  uniform_bucket_level_access = true
  force_destroy               = var.storage_force_destroy

  versioning {
    enabled = true
  }

  labels = merge(
    var.common_labels,
    {
      name        = "terraform-state"
      environment = var.environment
    }
  )
}

