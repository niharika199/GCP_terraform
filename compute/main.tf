
provider "google" {
  project     = "${var.project}"
  region      = "us-east2"
}

#If the backend is not mentioned the state file will get stored in the local machine
terraform {            #stores the statefile in the gcs (like s3 in AWS)
  backend "gcs" {
    bucket  = "info-buc-1"
    prefix  = "terraform/statefile"
  }
}


#Declaring the variables which are present inside the module
module "network"{
source = "modules/"  #path of the module present
nw_name ="${var.nw_name}"
auto_create_subnetworks="${var.auto_create_subnetworks}"
fw_name = "${var.fw_name}"
ins_name = "${var.ins_name}"
machine_type ="${var.machine_type}"
zone ="${var.zone}"
sbnt_name = "${var.sbnt_name}"
cidr ="${var.cidr}"
sbnt_region="${var.sbnt_region}"
}

