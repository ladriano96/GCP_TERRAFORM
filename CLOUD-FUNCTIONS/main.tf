terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("pj-ladriano-cloud-4704092b4b5b.json")

  project = var.project_id
  region  = var.region_name
}

provider "google-beta" {
  alias       = "beta"
  credentials = file("pj-ladriano-cloud-4704092b4b5b.json")
  project     = var.project_id
  region      = var.region_name
}
