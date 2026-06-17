resource "google_sql_database_instance" "postgres" {
  name             = "postgres-db"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    backup_configuration {
      enabled = true
    }
  }

  deletion_protection = false
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