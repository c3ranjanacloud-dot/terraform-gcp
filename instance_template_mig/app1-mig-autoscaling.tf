#Resource google_compute_region_autoscaler
resource "google_compute_region_autoscaler" "myapp1" {
  name   = "${local.name}-myapp1-autoscaler"
  region = var.gcp_region
  target = google_compute_region_instance_group_manager.myapp1.id
  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 2
    cooldown_period = 60
    stabilization_period = 300
    # 90% CPU utilization
    cpu_utilization {
      target = 0.9   
    }
  }
}