variable "project_id" {
    type = string
    default = "pj-ladriano-cloud" 
}

variable "region_name" {
    type = string
    default = "southamerica-east1" 
}

variable "function_name" {
    type = string
    default = "ladriano_teste_function"
}

variable "runtime_type_python39" {
    type = string
    default = "python39"
  
}

variable "entry_point_name" {
    type = string
    default = "hello_world"
  
}