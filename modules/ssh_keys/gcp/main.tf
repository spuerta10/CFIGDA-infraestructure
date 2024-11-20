resource "google_compute_project_metadata_item" "ssh_keys" {
    key = "ssh-keys"
    value = "${var.username}:${var.openssh_public_key}"
}