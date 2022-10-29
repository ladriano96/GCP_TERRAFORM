variable "project_id" {
  description = "the name project id"
  type    = string
  default = "pj-ladriano-cloud"
}



variable "region_name" {
  description = "the name region"
  type    = string
  default = "southamerica-east1"
}



variable "function_name" {
  description = "the cloud function name"
  type    = string
  default = "cloudfunctions_gn1"
}



variable "runtime_type" {
  description = "a programming language to use"
  type    = string
  default = "python39"
}



variable "entry_point_name" {
  description = "the name entry point"
  type    = string
  default = "hello_world"
}



variable "bucket_name" {
  description = "the bucket name"
  type    = string
  default = "buck-dev-01"
}



variable "storage_class_standard" {
  description = "the type class storage"
  type    = string
  default = "STANDARD"
}



variable "description" {
  type    = string
  default = "the description here"
}



variable "cloud_functions_admin" {
  description = "the cloud functions admin"
  type    = string
  default = "roles/cloudfunctions.admin"
}



variable "cloud_functions_invoker" {
  description = "the cloud functions invoker"
  type    = string
  default = "roles/cloudfunctions.invoker"
}



variable "cloud_functions_developer" {
  description = "the cloud functions developer"
  type    = string
  default = "roles/cloudfunctions.developer"
}



variable "cloud_functions_viewer" {
  description = "the cloud functions viewer"
  type    = string
  default = "roles/cloudfunctions.viewer"
}



variable "members_allUsers" {
  description = "allowing all users with internet access"
  type    = list(any)
  default = ["allUsers"]
}



variable "members_user" {
  description = "allowing email with google account"
  type    = list(any)
  default = ["user:leonardoadriano93@gmail.com"]
}



variable "members_allAuthenticatedUsers" {
  description = "allowing authenticated users in gcp project"
  type    = list(any)
  default = ["allAuthenticatedUsers"]
}



variable "members_serviceAccount" {
  description = "allowing service account in gcp project"
  type    = list(any)
  default = ["serviceAccount:seuserviceaccount@appspot.gserviceaccount.com"]
}



variable "members_group" {
  description = "allowing google email group"
  type    = list(any)
  default = ["group:seugrupo@gmail.com"]
}



variable "members_domain" {
  description = "allowing a specific domain"
  type    = list(any)
  default = ["domain:seudomain.com"]
}







