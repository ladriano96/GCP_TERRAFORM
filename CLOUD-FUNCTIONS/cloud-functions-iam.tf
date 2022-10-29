data "google_iam_policy" "policy-viewer-function" {
  binding {
    role = "roles/viewer"
    members = [
      "user:leonardoadriano93@gmail.com",
    ]
  }
}

resource "google_cloudfunctions_function_iam_policy" "policy-function" {
  project        = var.project_id
  region         = var.region_name
  cloud_function = google_cloudfunctions_function.ladriano_teste_function.id
  policy_data    = data.google_iam_policy.policy-viewer-function.id
  depends_on     = [data.google_iam_policy.policy-viewer-function]
}
