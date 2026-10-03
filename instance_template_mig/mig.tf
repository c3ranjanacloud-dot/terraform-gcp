# Resource: google_compute_region__instance_group_manager

resource "google_compute_region_instance_group_manager" "myapp1" {
  name = "${local.name}-myapp1-mig"

  base_instance_name = "${local.name}-myapp1"
  region = var.gcp_region
  distribution_policy_zones = data.google_compute_zones.zones.names

  version {
    instance_template  = google_compute_region_instance_template.default.id
  }

#named Port
  named_port {
    name = "webserver"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_region_health_check.myapp1.id
    initial_delay_sec = 300
  }
} 