variable "zone" {
    type = string
    default = "us-central1-a"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "network" {
    type = string
    default = "default"
}

variable "boot_disk_image" {
    description = "Base image for the machine. By default the machine will use debian."
    type = string
    default = "projects/debian-cloud/global/images/debian-11-bullseye-v20231010"
}

variable "boot_disk_size" {
    description = "Size in GB for the machine's boot disk"
    type = number
    default = 50 #GB
}

variable "static_ip" {
    description = "Optional static public IP. If provided, it will be used; otherwise, a dynamic IP will be assigned."
    type = string
    default = null
}

# --------------------------------------------------

variable "machine_name" {
    type = string
}

variable "machine_type" {
    type = string
}

variable "metadata_startup_script" {
    description = "Path to startup script for the VM."
    type = string
}

variable "tags" {
    description = "Tags for the rule VM as follows: ['dev', 'sonarqube']"
    type = list(string)
}
