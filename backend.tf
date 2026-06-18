terraform {
  backend "gcs" {
    # IMPORTANT: Use environment-specific backend buckets to prevent state overwrites
    # Initialize with: terraform init -backend-config="bucket=bhanu6366-tf-state-dev" -backend-config="prefix=terraform/dev/state"
    # Or update backend dynamically before init based on ENVIRONMENT variable
    # For now, using shared bucket - MUST be changed for production!
    bucket = "bhanu6366-tf-state"
    prefix = "terraform/state"
  }
}