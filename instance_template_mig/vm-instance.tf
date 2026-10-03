resource "google_compute_instance_from_template" "tpl_vm" {
    for_each = toset(data.google_compute_zones.zones.names)
    name = "${local.name}-myapp1-vm"
    source_instance_template = google_compute_region_instance_template.default.self_link
    zone = each.key
}