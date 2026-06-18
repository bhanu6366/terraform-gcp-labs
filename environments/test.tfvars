project_id            = "devops-lab-test"
region                = "europe-west1"
bucket_name           = "bhanu6366-test-bucket"
bucket_location       = "EU"
environment           = "test"
ssh_source_ranges     = ["0.0.0.0/0"] # For test: allow all. Restrict for production
resource_prefix       = "test-devops"
storage_force_destroy = true
enable_private_ip     = false
# db_password: Use environment variable
# export TF_VAR_db_password="<test_password>"
