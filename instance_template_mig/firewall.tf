resource "google_compute_firewall" "fw1" {
    name = "ssh-allow-fw"
    network = google_compute_network.vpc.id
    allow {
        protocol = "tcp"
        ports = ["22"]
    }
    direction = "INGRESS"
    priority = 1000
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["ssh-allow-tag"]
}
#http port 80 firewall rule
resource "google_compute_firewall" "fwhttp" {
    name = "http-allow-fw"
    network = google_compute_network.vpc.id
    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    direction = "INGRESS"
    priority = 1000
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["webserver-tag"]
}