terraform {
  backend "gcs" {
    bucket = "bhanu6366-tf-state"
    prefix = "terraform/state"
  }
}