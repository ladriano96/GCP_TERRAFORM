/* DATA IAM POLICY GERAL PARA O CLOUD FUNCIONS */
data "google_iam_policy" "data-iam-policy-function" {

  /* NO CAMPO MEMBERS PODEM SER ADICIONADOS AS SEGUINTES VARIÁVEIS ABAIXO*/

  /* 1 - var.membres_user (identificador que representa qualquer pessoa que esteja na internet, com ou sem uma conta google)
     2 - var.members_allAuthenticatedUsers (identificador que representa qualquer pessoa autenticada com uma conta google ou conta de serviço)
     3 - var.members_user (endereço de e-mail que representa uma conta específica do google e tenha usuário criado no iam do projeto gcp)
     4 - var.members_serviceAccount (endereço de e-mail que representa uma conta de serviço e tenha usuário criado no iam do projeto gcp)
     5 - var.members_group (um endereço que representa um grupo de e-mail do google)
     6 - var.members_domain (cominio que representa todos os usuários desse dominio)     */

  binding {
    role    = var.cloud_functions_admin
    members = var.members_user
  }
  binding {
    role    = var.cloud_functions_invoker
    members = var.members_user
  }

  binding {
    role    = var.cloud_functions_developer
    members = var.members_user
  }

  binding {
    role    = var.cloud_functions_viewer
    members = var.members_allAuthenticatedUsers
  }

  depends_on = [google_cloudfunctions_function.cloudfunctions_g1_01, google_cloudfunctions_function.cloudfunctions_g1_02, google_cloudfunctions_function.cloudfunctions_g1_03]


}

/* IAM POLICY PARA A CLOUDFUNCTION G1_01 */
resource "google_cloudfunctions_function_iam_policy" "policy-function" {
  project        = var.project_id
  region         = var.region_name
  cloud_function = google_cloudfunctions_function.cloudfunctions_g1_01.name
  policy_data    = data.google_iam_policy.data-iam-policy-function.policy_data
  depends_on     = [data.google_iam_policy.data-iam-policy-function]

}


/* IAM POLICY PARA A CLOUDFUNCTION G1_02 */
resource "google_cloudfunctions_function_iam_policy" "policy-function-02" {
  project        = var.project_id
  region         = var.region_name
  cloud_function = google_cloudfunctions_function.cloudfunctions_g1_02.name
  policy_data    = data.google_iam_policy.data-iam-policy-function.policy_data
  depends_on     = [data.google_iam_policy.data-iam-policy-function]

}


/* IAM POLICY PARA A CLOUDFUNCTION G1_03 */
resource "google_cloudfunctions_function_iam_policy" "policy-function-03" {
  project        = var.project_id
  region         = var.region_name
  cloud_function = google_cloudfunctions_function.cloudfunctions_g1_03.name
  policy_data    = data.google_iam_policy.data-iam-policy-function.policy_data
  depends_on     = [data.google_iam_policy.data-iam-policy-function]

}



/* IAM POLICY PARA A CLOUDFUNCTION G2_01 */
resource "google_cloudfunctions2_function_iam_policy" "policy-function-04" {
  provider       = google-beta.beta
  project        = var.project_id
  location       = var.region_name
  cloud_function = google_cloudfunctions2_function.cloudfunctions_g2_01.name
  policy_data    = data.google_iam_policy.data-iam-policy-function.policy_data
  depends_on     = [data.google_iam_policy.data-iam-policy-function]

}


