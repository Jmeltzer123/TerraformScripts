resource "google_project_iam_member" "app_logging" {
    //Project/Resource | Role | Member
  project = "my-project-id"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.app.email}"
}

resource "google_project_iam_member" "app_storage" {
  project = "my-project-id"
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.app.email}"
}