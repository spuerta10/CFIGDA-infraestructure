variable "network" {
    description = "Name of the network in which the rule will be taking effect."
    type = string
    default = "default"
}

variable "source_ranges" {
    description = "Allow traffic from which IP's. By default allows traffic from every IP."
    type = string
    default = "0.0.0.0/0"
}

# ----------------------------------------------------------------------------------------------

variable "rule_name" {
    description = "Firewall rule name"
    type = string
}

variable "allow_protocol" {
    type = string
}

variable "allow_ports" {
    description = "List of ports to allow ingress traffic as follows: ['9000', '80']"
    type = list(string)
}

variable "target_tags" {
    description = "Tags for which the rule will be taking effect as follows: ['dev', 'sonarqube']"
    type = list(string)
}