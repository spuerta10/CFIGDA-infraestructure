resource "google_compute_firewall" "allow_protocol" {
    name = var.rule_name
    network = var.network

    allow {
        protocol = var.allow_protocol
        ports = var.allow_ports

    }
    source_ranges = [var.source_ranges]
    target_tags = var.target_tags
}