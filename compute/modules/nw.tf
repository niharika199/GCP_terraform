variable "nw_name" {}
variable "auto_create_subnetworks" {}

resource "google_compute_network" "test-nw" {
  name                    = "${var.nw_name}"
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
}
