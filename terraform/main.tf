terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
 
provider "google" {
  version = "3.5.0"
  credentials = file(var.credentials_file)
  project = var.project
  region = var.region
  zone = var.zone
 
}
 
resource "google_compute_network" "vpc_network" {
  name = "homework6-network"
}
 
resource "google_compute_address" "vm_static_ip" {
  name = "homework6-static-ip"
}
 
 
resource "google_compute_instance" "vm_instance" {
  name         = "homework6-instance1"
  machine_type = var.machine_types[var.environment]
  tags         = ["web", "dev"]
 
  provisioner "local-exec" {
     command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }
 
  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }
 
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}
"google_compute_instance" "vm_instance" {
  name         = "homework6-instance2"
  machine_type = var.machine_types[var.environment]
  tags         = ["web", "dev"]
 
  provisioner "local-exec" {
     command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }
 
  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }
 
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}
"google_compute_instance" "vm_instance" {
  name         = "homework6-instance3"
  machine_type = var.machine_types[var.environment]
  tags         = ["db", "dev"]
 
  provisioner "local-exec" {
     command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }
 
  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }
 
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}
"google_compute_instance" "vm_instance" {
  name         = "homework6-instance4"
  machine_type = var.machine_types[var.environment]
  tags         = ["db", "dev"]
 
  provisioner "local-exec" {
     command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }
 
  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }
 
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}


