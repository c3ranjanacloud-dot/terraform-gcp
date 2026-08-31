/*output "vmname1" {
    description = "vmname01"
    value = google_compute_instance.vm[0].name
}
output "vmname2" {
    description = "vmname02"
    value = google_compute_instance.vm[1].name
}
output "vm_names_list" {
    description = "for loop with list"
    value = [for instance in google_compute_instance.vm : instance.name]
}
output "vm_names_map" {
    description = "for loop with map"
    value = {for instance in google_compute_instance.vm : instance.name => instance.instance_id}
}
output "vmname_legacy_splat" {
    description = "legacy splat operator"
    value = google_compute_instance.vm.*.name
}

output "vmname_generalized_latest_splat" {
    description = "generalised latest splat operator"
    value = google_compute_instance.vm[*].name
}*/

# Terraform Output Values
# Output - For with list
output "for_output_list1" {
  description = "For Loop with List"
  value = [for instance in google_compute_instance.vm: instance.name]
}

# Output - For Loop with Map 
output "for_output_map1" {
  description = "For Loop with Map1"
  value = {for instance in google_compute_instance.vm: instance.name => instance.instance_id}
}

# Output - VM External IPs
output "vm_external_ips" {
  description = "VM Instance Names -> VM External IPs"
  value = {for instance in google_compute_instance.vm: instance.name => instance.network_interface.0.access_config.0.nat_ip}
}