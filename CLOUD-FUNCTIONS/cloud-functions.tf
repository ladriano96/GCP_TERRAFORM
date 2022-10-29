/* CLOUD FUNCTIONS 1ª GERACAO COM TRIGGER HTTP ATIVA */
resource "google_cloudfunctions_function" "cloudfunctions_gn1" {
  name                  = var.function_name
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  trigger_http          = true
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.functionladriano.name
  available_memory_mb   = "2048"
  max_instances         = "5"
  timeout               = "60"

  labels = {
    "enviroment" = "dev"
  }
  depends_on = [google_storage_bucket_object.functionladriano]
}
