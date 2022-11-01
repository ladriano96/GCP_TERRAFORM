
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
  /* (Se voce quiser usar vpc connector na function, basta descomentar a linha abaixo e criar o connector do arquivo vpc-connector.tf) */
  #vpc_connector = var.vpc_connector

  labels = {
    "enviroment" = var.env
  }
  /* descomentar o comentário abaixo "google_vpc_access_connector.vpc-connector-g1" para criar a function*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, /*google_vpc_access_connector.vpc-connector-g1*/]
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
  available_memory_mb   = "512"
  max_instances         = "3"
  timeout               = "60"
  /* (Se voce quiser usar vpc connector na function, basta descomentar a linha abaixo e criar o connector do arquivo vpc-connector.tf) */
  #vpc_connector         = var.vpc_connector

  event_trigger {
    event_type = var.pub_sub_g1
    resource   = var.pub_sub_topic
    failure_policy {
      retry = true
    }
  }

  /* descomentar o comentário abaixo "google_vpc_access_connector.vpc-connector-g1" para criar a function*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, /*google_vpc_access_connector.vpc-connector-g1*/]
  labels = {
    "enviroment" = var.env
  }
}






/* CLOUD FUNCTIONS 1ª GERACAO COM EVENT TRIGGER CLOUD STORAGE */
resource "google_cloudfunctions_function" "cloudfunctions_g1_03" {
  name                  = "funct-${var.project_id}-${var.env}-03"
  runtime               = var.runtime_type
  description           = var.description
  project               = var.project_id
  region                = var.region_name
  entry_point           = var.entry_point_name
  source_archive_bucket = google_storage_bucket.storage_bucket.name
  source_archive_object = google_storage_bucket_object.storage_bucket_object.name
  available_memory_mb   = "512"
  max_instances         = "3"
  timeout               = "60"
  /* (Se voce quiser usar vpc connector na function, basta descomentar a linha abaixo e criar o connector do arquivo vpc-connector.tf) */
  #vpc_connector         = var.vpc_connector



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


  /* descomentar o comentário abaixo "google_vpc_access_connector.vpc-connector-g1" para criar a function, caso você use o vpc connector nessa function*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, /*google_vpc_access_connector.vpc-connector-g1*/]
  labels = {
    "enviroment" = var.env
  }
}






/* CLOUD FUNCTIONS 2ª GERACAO COM TRIGGER HTTP */
resource "google_cloudfunctions2_function" "cloudfunctions_g2_01" {
  provider    = google-beta.beta
  name        = "fcnt-${var.project_id}-${var.env}-04"
  location    = var.region_name
  description = var.description

  build_config {
    runtime     = var.runtime_type
    entry_point = var.entry_point_name
    source {
      storage_source {
        bucket = google_storage_bucket.storage_bucket.name
        object = google_storage_bucket_object.storage_bucket_object.name
      }
    }
  }
  service_config {
    min_instance_count = 1
    max_instance_count = 2
    available_memory   = "256M"
    timeout_seconds    = 60

    /* (Se voce quiser usar vpc connector na function, basta descomentar as linhas abaixo e criar o connector do arquivo vpc-connector.tf) */
    #vpc_connector                = var.vpc_connector
    #vpc_connector_egress_settings = "ALL_TRAFFIC"
  }

  /* descomentar o comentário abaixo "google_vpc_access_connector.vpc-connector-g1" para criar a function, caso você use o vpc connector nessa function*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, google_vpc_access_connector.vpc-connector-g1]
  labels = {
    "enviroment" = var.env
  }

}





/* CLOUD FUNCTIONS 2ª GERACAO COM EVENT TRIGGER PUB/SUB */
resource "google_cloudfunctions2_function" "cloudfunctions_g2_02" {
  provider    = google-beta.beta
  name        = "fcnt-${var.project_id}-${var.env}-05"
  location    = var.region_name
  description = var.description

  build_config {
    runtime     = var.runtime_type
    entry_point = var.entry_point_name
    source {
      storage_source {
        bucket = google_storage_bucket.storage_bucket.name
        object = google_storage_bucket_object.storage_bucket_object.name
      }
    }
  }

  event_trigger {
    trigger_region = var.region_name
    event_type     = var.pub_sub_g2
    pubsub_topic   = var.pub_sub_topic
    retry_policy   = "RETRY_POLICY_RETRY"
  }
  service_config {
    min_instance_count = 1
    max_instance_count = 2
    available_memory   = "256M"
    timeout_seconds    = 60

    /* (Se voce quiser usar vpc connector na function, basta descomentar as linhas abaixo e criar o connector do arquivo vpc-connector.tf) */
    #vpc_connector                = var.vpc_connector
    #vpc_connector_egress_settings = "ALL_TRAFFIC"
  }


  /* descomentar o comentário abaixo "google_vpc_access_connector.vpc-connector-g1" para criar a function, caso você use o vpc connector nessa function*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, google_vpc_access_connector.vpc-connector-g1]
  labels = {
    "enviroment" = var.env
  }

}






/* CLOUD FUNCTIONS 2ª GERACAO COM EVENT TRIGGER CLOUD STORAGE */
resource "google_cloudfunctions2_function" "cloudfunctions_g2_03" {
  provider    = google-beta.beta
  name        = "fcnt-${var.project_id}-${var.env}-06"
  location    = var.region_name
  description = var.description

  build_config {
    runtime     = var.runtime_type
    entry_point = var.entry_point_name
    source {
      storage_source {
        bucket = google_storage_bucket.storage_bucket.name
        object = google_storage_bucket_object.storage_bucket_object.name
      }
    }
  }

  /* NO CAMPO "event_type" PODEM SER ADICIONADOS AS SEGUINTES VARIÁVEIS ABAIXO*/

  /* 1 - var.storage_finalize_g2 (A função é "trigada" qunado um novo objeto é criado ou substituído no bucket)
     2 - var.storage_delete_g2 (A função é "trigada" quando um objeto é excluído permanentemente)
     3 - var.storage_archive_g2 (A função é "trigada" quando uma versão ativa de um objeto se torna uma versão não atual)
     4 - var.storage_metadataUpdate_g2(A função é "trigada" qunado os metadados de um objeto são alterados)  */

  event_trigger {
    trigger_region = var.region_name
    event_type     = var.storage_delete_g2
    retry_policy   = "RETRY_POLICY_RETRY"

    event_filters {
      attribute = "bucket"
      value     = google_storage_bucket.storage_bucket.name
    }
  }
  service_config {
    min_instance_count = 1
    max_instance_count = 2
    available_memory   = "256M"
    timeout_seconds    = 60
    /* (Se voce quiser usar vpc connector na function, basta descomentar as linhas abaixo e criar o connector do arquivo vpc-connector.tf) */
    #vpc_connector                = var.vpc_connector
    #vpc_connector_egress_settings = "ALL_TRAFFIC"
  }


  /* descomentar o comentário abaixo "google_vpc_access_connector.vpc-connector-g1" para criar a function, caso você use o vpc connector nessa function*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, google_vpc_access_connector.vpc-connector-g1]
  labels = {
    "enviroment" = var.env
  }

}



