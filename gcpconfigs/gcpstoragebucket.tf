resource "google_storage_bucket" "app_data" {
  name     = "my-unique-app-data-bucket"
  location = "US"

  uniform_bucket_level_access = true
}