resource "google_compute_network" "vpc" {
    name = "vpc1"
    auto_create_subnetworks= false
}
resource "google_compute_subnetwork" "subnet" {
    name = "subnet-1"
    region = "us-central1"
    network = google_compute_network.vpc.id
    ip_cidr_range = "10.0.1.0/24"
}
