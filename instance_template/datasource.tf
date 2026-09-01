data "google_compute_zones" "zones" {
    status = "UP"
}

output "compute_zones" {
    description = "list of zones"
    value = data.google_compute_zones.zones.names
}
data "google_compute_image" "my_image" {
  project = "debian-cloud"  
  family  = "debian-12"
}
