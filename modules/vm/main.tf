resource "google_compute_instance" "vm" {
    name = var.machine_name
    machine_type = var.machine_type
    zone = var.zone

    network_interface {
        network = var.network
        access_config {
            # Use the static IP if provided
            nat_ip = var.static_ip != null ? var.static_ip : null
        } # Asign public IP to VM
    }

    boot_disk {
        initialize_params {
            image = var.boot_disk_image
            size = var.boot_disk_size
        }
    }

    metadata_startup_script = var.metadata_startup_script

    tags = var.tags
    allow_stopping_for_update = true
}