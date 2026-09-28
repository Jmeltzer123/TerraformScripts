resource "google_compute_network" "main"{ 
    //Two parts - name and auto_create_subnetworks
    name = "main-network"
    auto_create_subnetworks = true
}


//Subnet
resource "google_compute_subnetwork" "web_subnet"{ 
    //Name of Subnet | CIDR | Region/Zone | Network Apart Of
    name = "web-subnet"
    ip_cidr_range = "10.0.0.0/24"
    region = "us-east1"
    network = google_compute_network.main.id
}