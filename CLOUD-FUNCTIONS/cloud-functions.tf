
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
    "enviroment" = "dev"
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
    event_type = var.pub_sub
    resource   = var.pub_sub_topic
    failure_policy {
      retry = true
    }
  }

  /* descomentar o comentário abaixo "google_vpc_access_connector.vpc-connector-g1" para criar a function*/
  depends_on = [google_storage_bucket_object.storage_bucket_object, /*google_vpc_access_connector.vpc-connector-g1*/]
  labels = {
    "enviroment" = "dev"
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

  /* 1 - var.membres_user (identificador que representa qualquer pessoa que esteja na internet, com ou sem uma conta google)
     2 - var.members_allAuthenticatedUsers (identificador que representa qualquer pessoa autenticada com uma conta google ou conta de serviço)
     3 - var.members_user (endereço de e-mail que representa uma conta específica do google e tenha usuário criado no iam do projeto gcp)
     4 - var.members_serviceAccount (endereço de e-mail que representa uma conta de serviço e tenha usuário criado no iam do projeto gcp)
     5 - var.members_group (um endereço que representa um grupo de e-mail do google)
     6 - var.members_domain (cominio que representa todos os usuários desse dominio)     */
  
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
    "enviroment" = "dev"
  }
}




