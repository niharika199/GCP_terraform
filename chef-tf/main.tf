provider "google"{
project     = "proj-211305"
  region    = "us-east2"
}


resource "google_compute_instance" "default" {
  name         = "test-cf"
  machine_type = "n1-standard-1"
  zone         = "us-west2-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata {
        sshKeys = "niharika:${file("pv_key")}"
    }
   network_interface {
    network = "default"
  
  access_config {
      // Ephemeral IP
    }
}
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

   connection {
            type = "ssh"
            user = "niharika"
            private_key = "${file("key.pem")}"
        }


provisioner "chef"  {
        environment = "_default"
        run_list = ["nginx::default"]
        node_name = "test-node"
        server_url = "https://api.chef.io/organizations/organis"
        recreate_client = true
        user_name = "niharika1"
        user_key = "${file("niharika.pem")}"
        fetch_chef_certificates = true
    }

}
