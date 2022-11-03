variable "project_id" {
  description = "the name project id"
  type        = string
}

variable "env" {
  description = "the environment name. like prd"
  type        = string
}



variable "region_name" {
  description = "the name GCP region"
  type        = string
}


variable "vpc" {
  description = "the vpc name for create the vpc connector"
  type        = string
}



variable "vpc_connector_max_instances" {
  description = "the vpc connector max instances"
  type        = string
  default     = "3"
}



variable "vpc_connector_min_instances" {
  description = "the vpc connector min instances"
  type        = string
  default     = "2"
}



variable "vpc_connector_machine_type" {
  description = "the vpc connector machine type"
  type        = string
  default     = "f1-micro"
}




variable "subnet" {
  description = "the subnet CIDR"
  type        = string
}


variable "storage_bucket_object_name" {
  description = "the Path where the object to be inserted into the bucket is"
  type = string 
}




variable "storage_bucket_object_source" {
  description = "Name of the zip file that is the code of your function"
  type = string 
}




variable "function_available_memory_mb" {
  description = "the function abailable memory mb"
  type        = string
  default     = "512"
}



variable "function_max_instances" {
  description = "the function max instances"
  type        = string
  default     = "3"
}



variable "function_timeout" {
  description = "the function timeout"
  type        = string
  default     = "60"
}




variable "runtime_type" {
  description = "a programming language to use"
  type        = string
  default     = "python39"
}



variable "entry_point_name" {
  description = "the name entry point"
  type        = string
}




variable "storage_class_standard" {
  description = "the type class storage"
  type        = string
  default     = "STANDARD"
}



variable "description" {
  type    = string
  default = null
}



variable "cloud_functions_admin" {
  description = "the cloud functions admin"
  type        = string
  default     = "roles/cloudfunctions.admin"
}



variable "cloud_functions_invoker" {
  description = "the cloud functions invoker"
  type        = string
  default     = "roles/cloudfunctions.invoker"
}



variable "cloud_functions_developer" {
  description = "the cloud functions developer"
  type        = string
  default     = "roles/cloudfunctions.developer"
}



variable "cloud_functions_viewer" {
  description = "the cloud functions viewer"
  type        = string
  default     = "roles/cloudfunctions.viewer"
}



variable "members_allUsers" {
  description = "allowing all users with internet access"
  type        = list(any)
  default     = ["allUsers"]
}



variable "members_user" {
  description = "allowing email with google account"
  type        = list(any)
}



variable "members_allAuthenticatedUsers" {
  description = "allowing authenticated users in gcp project"
  type        = list(any)
}



variable "members_serviceAccount" {
  description = "allowing service account in gcp project"
  type        = list(any)
}



variable "members_group" {
  description = "allowing google email group"
  type        = list(any)
}



variable "members_domain" {
  description = "allowing a specific domain"
  type        = list(any)
}



variable "pub_sub_g1" {
  description = "the pub/sub primary generation api"
  type        = string
  default     = "google.pubsub.topic.publish"
}





variable "storage_finalize_g1" {
  description = "the cloud storage object finalize primary generation api"
  type        = string
  default     = "google.storage.object.finalize"
}





variable "storage_delete_g1" {
  description = "the cloud storage object delete primary generation api"
  type        = string
  default     = "google.storage.object.delete"
}




variable "storage_archive_g1" {
  description = "the cloud storage object archive primary generation api"
  type        = string
  default     = "google.storage.object.archive"
}





variable "storage_metadataUpdate_g1" {
  description = "the cloud storage object metadataUpdate primary generation api"
  type        = string
  default     = "google.storage.object.metadataUpdate"
}




variable "pub_sub_topic" {
  description = "the pub/sub topic primary generation name "
  type        = string
  default     = "projects/nomedoseuprojeto/topics/topic-functions"

}





