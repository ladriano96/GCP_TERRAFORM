resource "google_storage_bucket" "storage_bucket" {
  project       = var.project_id
  name          = "buck-${var.project_id}-${var.env}-01"
  location      = var.region_name
  storage_class = var.storage_class_standard
  force_destroy = true
  labels = {
    "enviroment" = var.env
  }
}


resource "google_storage_bucket_object" "storage_bucket_object" {
  name       = "cloud-functios/code-functions"
  bucket     = google_storage_bucket.storage_bucket.name
  source     = "code-functions/functions.zip"
  depends_on = [google_storage_bucket.storage_bucket]

}
