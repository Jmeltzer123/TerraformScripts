resource "google_container_cluster" "main" {
  name     = "main-cluster"
  location = "us-east1"

  initial_node_count = 1
}