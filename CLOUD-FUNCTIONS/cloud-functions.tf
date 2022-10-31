/* CLOUD FUNCTIONS 1ª GERACAO COM TRIGGER HTTP */
resource "google_cloudfunctions_function" "cloudfunctions_g1_01" {
  name                  = "funct-${var.project_id}-${var.env}-01"
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  trigger_http          = true
  available_memory_mb   = "2048"
  max_instances         = "5"
  timeout               = "60"
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.storage_bucket.name
  source_archive_object = google_storage_bucket_object.storage_bucket_object.name
  /* (Se quiser usar vpc connector na function basta descomentar a linha abaixo e criar o connector do arquivo vpc-connector.tf) */
  vpc_connector         = var.vpc_connector 

  labels = {
    "enviroment" = "dev"
  }
  /* descomentar o resource "gogolee_vpc_access_connector" no campo de "depends_on" na hora de criar a function com o vpc connector)*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, google_vpc_access_connector.vpc-connector-g1]
}





/* CLOUD FUNCTIONS 1ª GERACAO COM EVENT TRIGGER PUB/SUB */
resource "google_cloudfunctions_function" "cloudfunctions_g1_02" {
  name                  = "funct-${var.project_id}-${var.env}-02"
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
