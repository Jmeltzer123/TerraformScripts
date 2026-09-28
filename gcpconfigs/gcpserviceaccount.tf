resource "google_service_account" "app" {
  account_id   = "app-service-account"
  display_name = "Application Service Account"
}