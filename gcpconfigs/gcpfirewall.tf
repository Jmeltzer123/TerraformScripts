//GCP Firewall Declaration
resource "google_compute_firewall" "web_firewall" {
  //Name of FireWall | Network Attached to 
  name    = "web-firewall"
  network = google_compute_network.main.id
 //Allow 
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}