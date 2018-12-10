variable "nw_name" {}
variable "auto_create_subnetworks" {}
variable "fw_name"{}

resource "google_compute_network" "test-nw" {
  name                    = "${var.nw_name}"
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
}

resource "google_compute_firewall""test-firewall"{
  name    = "${var.fw_name}"
  network = "${google_compute_network.test-nw.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }


}
