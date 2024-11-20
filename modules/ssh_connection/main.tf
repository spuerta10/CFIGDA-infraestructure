resource "null_resource" "ssh_connection" {
    provisioner "remote-exec" {
        connection {
            type = "ssh"
            host = var.host_address
            user = var.username
            private_key = file(var.private_key_filepath)
        }

        inline = var.commands
    }
}