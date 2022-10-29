variable "project_id" {
  type    = string
  default = "pj-ladriano-cloud"
}



variable "region_name" {
  type    = string
  default = "southamerica-east1"
}



variable "function_name" {
  type    = string
  default = "ladriano_teste_function"
}



variable "runtime_type" {
  type    = string
  default = "python39"
}



variable "entry_point_name" {
  type    = string
  default = "hello_world"
}



variable "bucket_name" {
  type    = string
  default = "buck-ladriano-dev-01"
}



variable "storage_class_standard" {
  type    = string
  default = "STANDARD"
}



variable "description" {
  type    = string
  default = "the description here"
}



variable "cloud_functions_admin" {
  type    = string
  default = "roles/cloudfunctions.admin"
}



variable "cloud_functions_invoker" {
  type    = string
  default = "roles/cloudfunctions.invoker"
}



variable "cloud_functions_developer" {
  type    = string
  default = "roles/cloudfunctions.developer"
}



variable "cloud_functions_viewer" {
  type    = string
  default = "roles/cloudfunctions.viewer"
}



variable "members_allUsers" {
  type    = list(any)
  default = ["allUsers"]
}



variable "members_user" {
  type    = list(any)
  default = ["user:leonardoadriano93@gmail.com"]
}



variable "members_allAuthenticatedUsers" {
  type    = list(any)
  default = ["allAuthenticatedUsers"]
}



variable "members_serviceAccount" {
  type    = list(any)
  default = ["serviceAccount:seuserviceaccount@appspot.gserviceaccount.com"]
}



variable "members_group" {
  type    = list(any)
  default = ["group:seugrupo@gmail.com"]
}



variable "members_domain" {
  type    = list(any)
  default = ["domain:seudomain.com"]
}







