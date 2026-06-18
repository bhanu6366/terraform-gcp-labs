resource "google_sql_database_instance" "postgres" {
  name             = "${local.resource_prefix}-postgres-db"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier              = var.environment == "prod" ? "db-custom-2-8192" : "db-f1-micro"
    availability_type = var.environment == "prod" ? "REGIONAL" : "ZONAL"
    backup_configuration {
      enabled    = true
      start_time = "03:00"
      location   = var.region
      backup_retention_settings {
        retained_backups = var.environment == "prod" ? 30 : 7
        retention_unit   = "COUNT"
      }
      transaction_log_retention_days = var.environment == "prod" ? 7 : 3
    }

    ip_configuration {
      ipv4_enabled    = var.environment == "prod" ? false : true
      private_network = var.environment == "prod" ? google_compute_network.vpc.id : null
    }
  }

  # Enable deletion protection for prod, allow for dev/test
  deletion_protection = var.environment == "prod" ? true : false

  depends_on = [google_compute_network.vpc]
}
resource "google_sql_database" "appdb" {
  name     = "appdb"
  instance = google_sql_database_instance.postgres.name
}
resource "google_sql_user" "appuser" {
  name     = "appuser"
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}