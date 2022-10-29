data "google_iam_policy" "data-iam-plcy-function" {
    
                           /* NO CAMPO MEMBERS PODEM SER ADICIONADOS OS SEGUINTES VALORES ABAIXOS*/

/*  1 - allUsers (identificador que representa qualquer pessoa que esteja na internet, com ou sem uma conta google)
    2 - allAuthenticatedUsers (identificador que representa qualquer pessoas autenticada com uma conta google ou conta de serviço)
    3 - user:user@gmail.com (endereço de e-mail que representa uma conta específica do google e tenha usuário criado no iam do projeto gcp)
    4 - serviceAccount:seuserviceaccount@appspot.gserviceaccount.com (endereço de e-mail que representa uma conta de serviço e tenha usuário criado no iam do projeto gcp)
    5 - group:seugrupo@gmail.com (um endereço que representa um grupo de e-mail do google)
    6 - domain:domain.com (cominio que representa todos os usuários desse dominio)     */

  binding {
    role    = "roles/cloudfunctions.admin"
    members = ["user:leonardoadriano93@gmail.com"]
  }
  binding {
    role    = "roles/cloudfunctions.invoker"
    members = ["user:leonardoadriano93@gmail.com"]
  }

  binding {
    role    = "roles/cloudfunctions.developer"
    members = ["user:leonardoadriano93@gmail.com"]
  }

  binding {
    role    = "roles/cloudfunctions.viewer"
    members = ["allAuthenticatedUsers"]
  }

  depends_on = [google_cloudfunctions_function.ladriano_teste_function]

}

resource "google_cloudfunctions_function_iam_policy" "plcy-function" {
  project        = var.project_id
  region         = var.region_name
  cloud_function = google_cloudfunctions_function.ladriano_teste_function.name
  policy_data    = data.google_iam_policy.data-iam-plcy-function.policy_data
  depends_on     = [data.google_iam_policy.data-iam-plcy-function]
}
