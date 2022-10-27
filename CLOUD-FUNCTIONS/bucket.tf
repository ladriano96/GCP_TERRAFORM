resource "google_storage_bucket" "buck-ladriano-dev-01" {
  name     = var.bucket_name
  location = var.region_name
}
