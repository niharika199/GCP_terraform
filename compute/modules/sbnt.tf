variable "sbnt_name"{}
variable "cidr"{}
variable "sbnt_region"{}


resource "google_compute_subnetwork" "sub-net1" {
  name          = "${var.sbnt_name}"
  ip_cidr_range = "${var.cidr}"
  region        = "${var.sbnt_region}"
  network       = "${google_compute_network.test-nw.self_link}"
}
