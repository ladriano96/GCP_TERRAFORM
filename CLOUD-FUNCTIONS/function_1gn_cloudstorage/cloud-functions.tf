

/* CLOUD FUNCTIONS 1ª GERACAO COM EVENT TRIGGER CLOUD STORAGE */
resource "google_cloudfunctions_function" "cloudfunctions_g1_01" {
  name                  = "funct-${var.project_id}-${var.env}-01"
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.storage_bucket.name
  source_archive_object = google_storage_bucket_object.storage_bucket_object.name
  available_memory_mb   = var.function_available_memory_mb
  max_instances         = var.function_max_instances
  timeout               = var.function_timeout
  vpc_connector         = google_vpc_access_connector.vpc-connector-g1.id



  /* NO CAMPO "event_type" PODEM SER ADICIONADOS AS SEGUINTES VARIÁVEIS ABAIXO*/

  /* 1 - var.storage_finalize_g1 (A função é "trigada" qunado um novo objeto é criado ou substituído no bucket)
     2 - var.storage_delete_g1 (A função é "trigada" quando um objeto é excluído permanentemente)
     3 - var.storage_archive_g1 (A função é "trigada" quando uma versão ativa de um objeto se torna uma versão não atual)
     4 - var.storage_metadataUpdate_g1(A função é "trigada" qunado os metadados de um objeto são alterados)  */


  event_trigger {
    event_type = var.storage_finalize_g1
    resource   = google_storage_bucket.storage_bucket.id
    failure_policy {
      retry = true
    }
  }

  depends_on = [google_storage_bucket_object.storage_bucket_object, google_vpc_access_connector.vpc-connector-g1]
  labels = {
    "enviroment" = var.env
  }
}

