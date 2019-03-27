terraform {
  backend "local" {}
}

provider "google" {
  version = "= 1.20.0"
  project = "${var.project}"
}

module "demo_mig" {
  source            = "GoogleCloudPlatform/managed-instance-group/google"
  version           = "1.1.10"
  region            = "${var.region}"
  zonal             = "false"
  name              = "demo-mig-${var.service_name}-${var.env}"
  size              = 2
  service_port      = 80
  service_port_name = "http"
  http_health_check = false
  compute_image     = "${var.image_id}"
}
