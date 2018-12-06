
provider "google" {
  project     = "${var.project}"
  region      = "us-east2"
}

module "network"{
source = "modules"
nw_name ="${var.nw_name}"
auto_create_subnetworks="${var.auto_create_subnetworks}"
ins_name = "${var.ins_name}"
machine_type ="${var.machine_type}"
zone ="${var.zone}"
sbnt_name = "${var.sbnt_name}"
cidr ="${var.cidr}"
sbnt_region="${var.sbnt_region}"
}

