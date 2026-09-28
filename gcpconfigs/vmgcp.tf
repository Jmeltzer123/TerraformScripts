provider "google" {
  project = "my-project-id"
  region  = "us-east1"
  zone    = "us-east1-b"
}
//GCP VM Delcaration 
resource "google_compute_instance" "web_server" {
    //Three Aspects - Name, Machine Type, Zone
  name         = "web-server"
  machine_type = "e2-medium"
  zone         = "us-east1-b"
//This is the OS Boots
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  //This where our VM is within our VPC
  network_interface {
    network = google_compute_network.main.id
  }
}
//GCP Network Declaration(name, subnet)
resource "google_compute_network" "main" {
  name                    = "main-network"
  auto_create_subnetworks = true

}
