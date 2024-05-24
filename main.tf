provider "google" {
  project     = "jagriti-411012"
  credentials = file("C:/Users/JAGRITI/Downloads/jagriti-411012-4c9ab7bf4591.json")
  region      = "us-central1"
}

module "vm_instances" {
  source        = "./modules/vm"
   vm_count      = 3
  #  name=""
  machine_type  = "e2-medium"
  boot_disk     = "ubuntu-os-cloud/ubuntu-2004-lts"
  zone          = "europe-north1-a"
  region        = "europe-north1"
  network_name  = "default"
  subnet_name   = "default"
  startup_script_path = "./script/ansible_install.sh"
}

locals {
  instance_names = [for i in range(module.vm_instances.vm_count) : "terra-ansible-${i + 1}"]
}

output "instance_names" {
  value = local.instance_names
}

