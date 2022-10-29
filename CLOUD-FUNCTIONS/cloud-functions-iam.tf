data "google_iam_policy" "policy-viewer-function" {
  binding {
    role = "roles/viewer"
    members = [
      "user:leonardoadriano93@gmail.com",
    ]
  }
  depends_on = [google_storage_bucket.buck-ladriano-dev-01]
}

resource "google_cloudfunctions_function_iam_policy" "policy-function" {
  project        = var.project_id
  region         = var.region_name
  cloud_function = google_cloudfunctions_function.ladriano_teste_function.name
  policy_data    = data.google_iam_policy.policy-viewer-function.policy_data
  depends_on     = [data.google_iam_policy.policy-viewer-function]
}
