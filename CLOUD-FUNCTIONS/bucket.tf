/*resource "google_storage_bucket" "buck-ladriano-dev-01" {
  project       = var.project_id
  name          = var.bucket_name
  location      = var.region_name
  storage_class = var.storage_class_standard
  force_destroy = false
  labels = {
    "enviroment" = "dev"
  }
}

resource "google_storage_bucket_object" "functionladriano" {
  name   = "functionladriano.py"
  bucket = var.bucket_name
  source = "functionladriano.py"

  depends_on = [google_storage_bucket.buck-ladriano-dev-01]

}
*/