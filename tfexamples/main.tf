terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("mis484-6.json")
  project = "REPLACE-WITH-YOUR-PROJECT-ID-EXAMPLE-jaundiced-prez-123456" 
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-dev-network"
}
resource "google_compute_address" "terraform_int" {
  name = "terraform-int-address"
  address_type = "INTERNAL"
}
resource "google_compute_instance" "vm_instance" {
  project = "mis484-6-287502"
	name	= "terraform-dev-instance"
	machine_type = "f1-micro"

	boot_disk {
		initialize_params {
			image = "debian-cloud/debian-9"
		}
	}

	network_interface {
		network = google_compute_network.vpc_network.name
		access_config {
		}
	}
}
