terraform {
  backend "local" {}
}

provider "google" {
  version = "= 1.20.0"
  project = "${var.project}"
}

module "demo_mig" {
  source                = "GoogleCloudPlatform/managed-instance-group/google"
  version               = "1.1.10"
  region                = "${var.region}"
  zonal                 = "false"
  name                  = "demo-mig-${var.service_name}-${var.env}"
  size                  = 2
  service_port          = 80
  service_port_name     = "http"
  http_health_check     = false
  compute_image         = "${var.image_id}"
  target_tags           = ["allow-http"]
  autoscaling           = true
  service_account_email = "${var.service_account_email}"
  startup_script        = "gsutil cp gs://${var.code_bucket}/service/${var.service_name}/code_versions/`gsutil cat gs://${var.code_bucket}/service/${var.service_name}/env/${var.env}/version.txt`/index.html /var/www/html/"
}

resource "google_compute_firewall" "default-ssh" {
  project = "${var.project}"
  name    = "${var.service_name}-${var.env}-vm-http"
  network = "${var.network}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]
}
