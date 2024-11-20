variable "region" {
    type = string
    default = "us-central1"
}

#---------------------------------

variable "ip_name" {
    type = string
    description = "Name of the static IP within GCP's project and region."
}