module "demo_mig" {
  source            = "GoogleCloudPlatform/managed-instance-group/google"
  version           = "1.1.15"
  region            = "${var.region}"
  zonal             = "false"
  name              = "demo_mig_${var.service_name}_${var.env}"
  size              = 2
  service_port      = 80
  service_port_name = "http"
  http_health_check = false
  compute_image     = "${var.image_id}"
}
