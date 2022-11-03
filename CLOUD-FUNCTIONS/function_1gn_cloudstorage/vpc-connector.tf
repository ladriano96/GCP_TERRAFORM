
/* VPC SERVLESS CONNECTOR */
resource "google_vpc_access_connector" "vpc-connector-g1" {
  provider      = google-beta.beta
  name          = "cnt-${var.env}-01"
  ip_cidr_range = var.subnet
  network       = var.vpc
  min_instances = var.vpc_connector_min_instance
  max_instances = var.vpc_connector_max_instances
  machine_type  = var.vpc_connector_machine_type

  depends_on = [google_storage_bucket_object.storage_bucket_object]

}
