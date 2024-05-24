# modules/vm/main.tf

resource "google_compute_instance" "vm_instances" {
   count         = var.vm_count
     name = "terra-ansible-${count.index + 1}"
  machine_type = var.machine_type
  zone         = var.zone
  # boot_disk = var.boot_disk
  # Add other configuration attributes as needed
  boot_disk {
    initialize_params {
      image = var.boot_disk
    }
    }
    network_interface {
    network = var.network_name
    subnetwork = var.subnet_name
    access_config {}
  }
   metadata_startup_script = file(var.startup_script_path)
}
output "vm_count" {
  value = var.vm_count
}