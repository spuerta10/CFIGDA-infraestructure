variable "host_address" {
    type = string
}

variable "username" {
    description = "Username to perform the SSH connection"
    type = string
}

variable "private_key_filepath" {
    type = string
}

variable "commands" {
    description = "List of commands for the VM to perform"
    type = list(string)
}