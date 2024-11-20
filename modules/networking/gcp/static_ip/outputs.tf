output "static_public_ip" {
    description = "Static IP reserved in the specified region."
    value = google_compute_address.static_ip.address
}