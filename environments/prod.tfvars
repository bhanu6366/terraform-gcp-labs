project_id            = "devops-lab-prod"
region                = "europe-west1"
bucket_name           = "bhanu6366-prod-bucket"
bucket_location       = "EU"
environment           = "prod"
ssh_source_ranges     = ["203.0.113.0/24"] # TODO: Update with your office/VPN IP ranges
resource_prefix       = "prod-devops"
storage_force_destroy = false # CRITICAL: Prevent accidental deletion in production
enable_private_ip     = true  # Use private IP for Cloud SQL in production
# db_password: Use environment variable or Google Secret Manager
# In CI/CD: export TF_VAR_db_password="$(gcloud secrets versions access latest --secret=prod-db-password)"