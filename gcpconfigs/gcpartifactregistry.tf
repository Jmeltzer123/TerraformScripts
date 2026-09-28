resource "google_artifact_registry_repository" "docker" {
  location      = "us-east1"
  repository_id = "app-images"
  format        = "DOCKER"
}