# Resource: Regional Health Check
resource "google_compute_region_health_check" "myapp1"{
    name = "${local.name}-myapp1"
    check_interval_sec = 10
    timeout_sec = 15
    healthy_threshold = 2
    unhealthy_threshold = 2
    http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}