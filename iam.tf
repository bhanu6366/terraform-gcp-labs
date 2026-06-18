# Service account for Cloud SQL client operations
resource "google_service_account" "cloud_sql_client" {
  account_id   = "${local.resource_prefix}-sql-client"
  display_name = "Cloud SQL Client - ${var.environment}"
  description  = "Service account for Cloud SQL operations"
}

# Service account for Compute Engine instances
resource "google_service_account" "compute_instance" {
  account_id   = "${local.resource_prefix}-compute-instance"
  display_name = "Compute Instance - ${var.environment}"
  description  = "Service account for Compute Engine instances"
}

# IAM role: Cloud SQL Client role
resource "google_project_iam_member" "cloud_sql_client" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloud_sql_client.email}"
}

# IAM role: Cloud SQL Instance User role
resource "google_project_iam_member" "cloud_sql_user" {
  project = var.project_id
  role    = "roles/cloudsql.instanceUser"
  member  = "serviceAccount:${google_service_account.cloud_sql_client.email}"
}

# IAM role: Compute Instance admin for compute service account
resource "google_project_iam_member" "compute_log_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.compute_instance.email}"
}

# IAM role: Metric Writer for compute service account
resource "google_project_iam_member" "compute_metric_writer" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.compute_instance.email}"
}

# IAM role: Cloud SQL Viewer for compute service account
resource "google_project_iam_member" "compute_sql_viewer" {
  project = var.project_id
  role    = "roles/cloudsql.viewer"
  member  = "serviceAccount:${google_service_account.compute_instance.email}"
}
