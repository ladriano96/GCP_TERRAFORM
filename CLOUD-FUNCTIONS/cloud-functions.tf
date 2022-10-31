/* CLOUD FUNCTIONS 1ª GERACAO COM TRIGGER HTTP SEM VPC CONNECTOR */
resource "google_cloudfunctions_function" "cloudfunctions_g1_01" {
  name                  = "funct-${var.project_id}-${var.env}-01"
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  trigger_http          = true
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.storage_bucket.name
  source_archive_object = google_storage_bucket_object.storage_bucket_object.name
  available_memory_mb   = "2048"
  max_instances         = "5"
  timeout               = "60"

  labels = {
    "enviroment" = "dev"
  }
  depends_on = [google_storage_bucket_object.storage_bucket_object]
}





/* CLOUD FUNCTIONS 1ª GERACAO COM TRIGGER HTTP E VPC CONNECTOR */
resource "google_cloudfunctions_function" "cloudfunctions_g1_02" {
  name                  = "funct-${var.project_id}-${var.env}-02"
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  trigger_http          = true
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.storage_bucket.name
  source_archive_object = google_storage_bucket_object.storage_bucket_object.name
  vpc_connector         = var.vpc_connector
  available_memory_mb   = "2048"
  max_instances         = "5"
  timeout               = "60"
  depends_on            = [google_vpc_access_connector.vpc-connector-g1]
  labels = {
    "enviroment" = "dev"
  }
}






/* CLOUD FUNCTIONS 1ª GERACAO COM EVENT TRIGGER PUB/SUB */
resource "google_cloudfunctions_function" "cloudfunctions_g1_03" {
  name                  = "funct-${var.project_id}-${var.env}-03"
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.storage_bucket.name
  source_archive_object = google_storage_bucket_object.storage_bucket_object.name
  vpc_connector         = var.vpc_connector
  available_memory_mb   = "2048"
  max_instances         = "5"
  timeout               = "60"
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = "projects/pj-ladriano-cloud/topics/topic-functions"
    failure_policy {
      retry = true
    }
  }

  depends_on = [google_vpc_access_connector.vpc-connector-g1]
  labels = {
    "enviroment" = "dev"
  }
}