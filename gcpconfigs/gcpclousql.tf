//GCP Cloud SQL Instance Declaration
resource "google_sql_database_instance" "main" {
  name             = "app-database"
  database_version = "POSTGRES_16"
  region           = "us-east1"

  settings {
    tier = "db-f1-micro"
  }

  
}
//Database in the Cloud SQL instance
resource "google_sql_database" "app_db" {
  name     = "application"
  instance = google_sql_database_instance.main.name
}