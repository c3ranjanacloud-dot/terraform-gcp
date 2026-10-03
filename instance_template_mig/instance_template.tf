resource "google_compute_region_instance_template" "default" {
  name        = "${local.name}-myapp1-template"
  description = "This template is used to create app server instances."

  tags = [tolist(google_compute_firewall.fw1.target_tags)[0], tolist(google_compute_firewall.fwhttp.target_tags)[0]]

  instance_description = "MyApp1 VM Instances"
  machine_type         = var.machine_type
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image      = data.google_compute_image.my_image.self_link
    auto_delete       = true
    boot              = true
  }


  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {
      
    }
  }
  # Install Webserver
  metadata_startup_script = file("${path.module}/webserver_install.sh")
  metadata = {
    environment = local.environment
  }
  labels ={
    environment = local.environment
  }


}
