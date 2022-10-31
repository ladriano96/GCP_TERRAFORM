
/* VPC SERVLESS CONNECTOR */
resource "google_vpc_access_connector" "vpc-connector-g1" {
  provider      = google-beta.beta
  name          = "cnt-${var.env}-01"
  ip_cidr_range = var.subnet
  network       = var.vpc
  min_instances = "2"
  max_instances = "3"
  machine_type  = "f1-micro"

  depends_on = [google_storage_bucket_object.storage_bucket_object]

}