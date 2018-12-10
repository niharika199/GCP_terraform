variable "ins_name"{}
variable "machine_type"{}
variable "zone"{}




resource "google_compute_instance" "test-ins" {
  name         = "${var.ins_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
#   network = "${google_compute_network.test-nw.id}"
    subnetwork ="${google_compute_subnetwork.sub-net1.id}"
    }
  }
