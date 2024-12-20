provider "google" {
    project = var.project_id
    region = var.region
}

module "allow_port" {
    source = "../../../modules/networking/gcp/firewall_rule"
    rule_name = "allow-9000-sonarqube-${var.environment}"
    allow_protocol = "tcp"
    allow_ports = ["9000"]
    target_tags = ["sonarqube"]
}

module "sonarqube_static_public_ip" {
    source = "../../../modules/networking/gcp/static_ip"
    ip_name = "test-sonarqube-${var.environment}-ip"
}

module "sonarqube_vm"  {
    source = "../../../modules/vm" 
    machine_name = "test-sonarqube-${var.environment}"
    machine_type = "e2-medium"
    static_ip = module.sonarqube_static_public_ip.static_public_ip
    metadata_startup_script = "${file("../../../scripts/install.docker.sh")}"
    tags = ["sonarqube", var.environment]

    depends_on = [ module.sonarqube_static_public_ip ]
}

module "sonarqube_docker_container" {
    source = "../../../modules/ssh_connection"
    host_address = module.sonarqube_vm.vm_public_ip
    username = var.username
    private_key_filepath = "${pathexpand("~")}/id_rsa"
    commands = ["sleep 60", "sudo docker pull sonarqube:latest", "sudo docker run -d --name sonarqube -p 9000:9000 sonarqube"]
    
    depends_on = [ module.sonarqube_vm ]
}