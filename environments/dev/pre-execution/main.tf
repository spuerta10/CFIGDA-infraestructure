provider "google" {
    project = var.project_id
    region = var.region
}

module "ssh_key" {
    source = "../../../modules/ssh_keys/local"   
}

module "save_public_key" {
    source = "../../../modules/ssh_keys/save"
    filepath = "${pathexpand("~")}/id_rsa.pub"
    file_content = module.ssh_key.public_key
    file_permission = "0644" # Public key can be read by others
    depends_on = [ module.ssh_key ]
}

module "save_private_key" {
    source = "../../../modules/ssh_keys/save"
    filepath = "${pathexpand("~")}/id_rsa"
    file_content = module.ssh_key.private_key
    file_permission = "0600" 
    depends_on = [ module.ssh_key ]
}

module "register_keys" {
    # Register SSH keys as GCP project keys.
    source = "../../../modules/ssh_keys/gcp"
    username = var.username
    openssh_public_key = module.ssh_key.public_key
}