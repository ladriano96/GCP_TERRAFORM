variable "project_id" {
  description = "the name project id"
  type        = string
  default     = "the name project id"
}

variable "env" {
  description = "the environment name"
  type        = string
  default     = "dev"
}



variable "region_name" {
  description = "the name region"
  type        = string
  default     = "southamerica-east1"
}


variable "vpc" {
  description = "the vpc name"
  type        = string
  default     = "the vpc name"

}

variable "vpc_connector" {
  description = "the vpc connector id"
  type        = string
  default     = "the vpc connector id"

}


variable "subnet" {
  description = "the subnet CIDR"
  type        = string
  default     = "the subnet CIDR"

}


variable "function_name" {
  description = "the cloud function name"
  type        = string
  default     = "cloudfunctions_gn1"
}



variable "runtime_type" {
  description = "a programming language to use"
  type        = string
  default     = "python39"
}



variable "entry_point_name" {
  description = "the name entry point"
  type        = string
  default     = "hello_world"
}




variable "storage_class_standard" {
  description = "the type class storage"
  type        = string
  default     = "STANDARD"
}



variable "description" {
  type    = string
  default = "the description here"
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
  default     = ["user:exemple@gamail.com"]
}



variable "members_allAuthenticatedUsers" {
  description = "allowing authenticated users in gcp project"
  type        = list(any)
  default     = ["allAuthenticatedUsers"]
}



variable "members_serviceAccount" {
  description = "allowing service account in gcp project"
  type        = list(any)
  default     = ["serviceAccount:seuserviceaccount@appspot.gserviceaccount.com"]
}



variable "members_group" {
  description = "allowing google email group"
  type        = list(any)
  default     = ["group:seugrupo@gmail.com"]
}



variable "members_domain" {
  description = "allowing a specific domain"
  type        = list(any)
  default     = ["domain:seudomain.com"]
}



variable "pub_sub_g1" {
  description = "the pub/sub primary generation api"
  type        = string
  default     = "google.pubsub.topic.publish"
}



variable "pub_sub_g2" {
  description = "the pub/sub secundary generation api"
  type        = string
  default     = "google.cloud.pubsub.topic.v1.messagePublished"
}




variable "storage_finalize_g1" {
  description = "the cloud storage object finalize primary generation api"
  type        = string
  default     = "google.storage.object.finalize"
}




variable "storage_finalize_g2" {
  description = "the cloud storage object finalize secundary generation api"
  type        = string
  default     = "google.cloud.storage.object.v1.finalized"
}




variable "storage_delete_g1" {
  description = "the cloud storage object delete primary generation api"
  type        = string
  default     = "google.storage.object.delete"
}



variable "storage_delete_g2" {
  description = "the cloud storage object delete secundary generation api"
  type        = string
  default     = "google.cloud.storage.object.v1.deleted"
}



variable "storage_archive_g1" {
  description = "the cloud storage object archive primary generation api"
  type        = string
  default     = "google.storage.object.archive"
}



variable "storage_archive_g2" {
  description = "the cloud storage object archive secundary generation api"
  type        = string
  default     = "google.cloud.storage.object.v1.archived"
}



variable "storage_metadataUpdate_g1" {
  description = "the cloud storage object metadataUpdate primary generation api"
  type        = string
  default     = "google.storage.object.metadataUpdate"
}



variable "storage_metadataUpdate_g2" {
  description = "the cloud storage object metadataUpdate secundary generation api"
  type        = string
  default     = "google.cloud.storage.object.v1.metadataUpdated"
}



variable "pub_sub_topic" {
  description = "the pub/sub topic primary generation name "
  type        = string
  default     = "projects/nomedoseuprojeto/topics/topic-functions"

}





