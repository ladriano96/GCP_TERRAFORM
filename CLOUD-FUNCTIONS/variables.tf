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

  /* você pode definir o campo default dessa variavel de acordo com a linguagem de programação que será executada na sua função. 
  As linguagens aceitas pelo Cloud Functions está contida nessa documentação https://cloud.google.com/functions/docs/concepts/execution-environment#runtimes */

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
