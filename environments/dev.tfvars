project_id            = "devops-lab-dev"
region                = "europe-west1"
bucket_name           = "bhanu6366-devops-lab-bucket-001"
bucket_location       = "EU"
environment           = "dev"
ssh_source_ranges     = ["0.0.0.0/0"] # For dev: allow all. For prod, restrict to your IP ranges
resource_prefix       = "dev-devops"
storage_force_destroy = true
enable_private_ip     = false
# db_password: Use environment variable instead of hardcoding
# export TF_VAR_db_password="<secure_password_from_secret_manager_or_local_secret>"