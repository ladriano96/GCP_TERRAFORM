provider "google" {
  credentials = file("pj-ladriano-cloud-ecf3b47ae249.json")

  project = var.projeto_name
  region  = var.region_name
}

