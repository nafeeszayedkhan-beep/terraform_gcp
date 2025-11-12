# 1. Configure the Google Provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Use a recent version of the GCP provider
    }
  }

  required_version = ">= 1.3.0"
}

provider "google" {
  project = "syncrivo"        # 🔹 Replace with your actual GCP project ID
  region  = "us-central1"     # 🔹 Default region for regional resources
  zone    = "us-central1-a"   # 🔹 Default zone for zonal resources
}

# 2. Define the Compute Instance Resource
resource "google_compute_instance" "default_vm" {
  name         = "terraform-vm"      # VM name
  machine_type = "e2-micro"          # VM type
  zone         = "us-central1-a"     # Zone to deploy in

  # Define the boot disk image (Debian 12 recommended)
  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
      size  = 10
      type  = "pd-balanced"
    }
  }

  # Attach the instance to the default

