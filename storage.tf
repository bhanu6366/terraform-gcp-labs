resource "google_storage_bucket" "terraform_state" {
  name                        = "bhanu6366-tf-state"
  location                    = "EU"
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "manual" {
  name                        = "bhanu6366-manual-import-bucket"
  location                    = "US"
  uniform_bucket_level_access = true
}