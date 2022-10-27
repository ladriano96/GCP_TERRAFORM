resource "google_storage_bucket" "buck-ladriano-dev-01" {
  project       = var.project_id
  name          = var.bucket_name
  location      = var.region_name
  storage_class = var.storage_class_standard
  force_destroy = true
  labels = {
    "enviroment" = "dev"
  }
}


resource "google_storage_bucket_object" "functionladriano" {
  name       = "function-phyton"
  bucket     = var.bucket_name
  source     = "functions-python/function.zip"
  depends_on = [google_storage_bucket.buck-ladriano-dev-01]

}
