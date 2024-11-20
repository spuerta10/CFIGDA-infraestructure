output "vm_ip" {
    value = google_compute_instance.vm.network_interface[0].network_ip
    description = "Internal IP of the deployed VM"
}

output "vm_public_ip" {
  description = "The IP address of the deployed VM."
  value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}