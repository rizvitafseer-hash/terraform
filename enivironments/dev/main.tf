terraform {
  cloud {
    organization = "YOUR_HCP_ORGANIZATION"

    workspaces {
      name = "gcp-dev"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source       = "../../modules/network"
  project_id   = var.project_id
  region       = var.region
  network_name = "enterprise-dev-vpc"
  subnet_cidr  = "10.10.0.0/24"
  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}

module "storage" {
  source      = "../../modules/storage"
  project_id  = var.project_id
  region      = var.region
  bucket_name = "${var.project_id}-dev-data"

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}