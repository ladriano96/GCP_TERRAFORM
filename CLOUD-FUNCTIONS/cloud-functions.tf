resource "google_cloudfunctions_function" "ladriano_teste_function" {
  name                  = var.function_name
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  trigger_http          = true
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.buck-ladriano-dev-01.name
  source_archive_object = google_storage_bucket_object.functionladriano.name
  available_memory_mb   = "2048"
  max_instances         = "5"
  timeout               = "60"

  labels = {
    "enviroment" = "dev"
  }

  depends_on = [google_storage_bucket_object.functionladriano]
}
