resource "tls_private_key" "ssh_key" {
    algorithm = var.ssh_algorithm
    rsa_bits = var.rsa_bits
}