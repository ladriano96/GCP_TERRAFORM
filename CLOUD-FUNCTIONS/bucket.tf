resource "google_storage_bucket" "bucket" {
  project       = var.project_id
  name          = "buck-${var.project_id}-${var.env}-01"
  location      = var.region_name
  storage_class = var.storage_class_standard
  force_destroy = true
  labels = {
    "enviroment" = "dev"
  }
}


resource "google_storage_bucket_object" "bucket_oject" {
  name       = "cloud-functios/function-phyton"
  bucket     = google_storage_bucket.bucket.name
  source     = "functions-python/functions.zip"
 depends_on = [google_storage_bucket.bucket]

}
