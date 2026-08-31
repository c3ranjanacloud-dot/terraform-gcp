data "google_compute_zones" "zones" {
    status = "UP"
}

output "compute_zones" {
    description = "list of zones"
    value = data.google_compute_zones.zones.names
}
