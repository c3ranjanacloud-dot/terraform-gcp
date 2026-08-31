variable "machine_type_map" {
    default = {
        "us-central1-a" = "e2-micro",
        "us-central1-b" = "e2-medium",
        "us-central1-c" = "e2-small",
    }
}
resource "google_compute_instance" "vm" {
   # count = 2
  #  name = "vm-${count.index}"
  #for_each with set input
    #for_each = toset(data.google_compute_zones.zones.names)
   # name = "vm-${each.key}"

   #for_each with map input
   for_each = var.machine_type_map
    name = "vm-${each.key}"
    machine_type = each.value
    #zone = data.google_compute_zones.zones.names[count.index]
    zone =  each.key
    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2204-lts"   
        }
    }
    network_interface {
        network = google_compute_network.vpc.id
        subnetwork = google_compute_subnetwork.subnet.id
            access_config {
        
    }
    }
    #tags=["webserver-tag", "ssh-allow-tag"]
    tags = [tolist(google_compute_firewall.fw1.target_tags)[0], tolist(google_compute_firewall.fwhttp.target_tags)[0]]

    metadata_startup_script = file("${path.module}/webserver_install.sh")


}