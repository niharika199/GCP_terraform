provider "google"{
project     = "project"
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
        sshKeys = "user:${file("key")}"
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
            user = "user"
            private_key = "${file("key.pem")}"
        }


provisioner "chef"  {
        environment = "_default"
        run_list = ["nginx::default"]
        node_name = "test-node"
        server_url = "https://<chef-server-url>"
        recreate_client = true
        user_name = "chef-user"
        user_key = "${file("pem")}"
        fetch_chef_certificates = true
    }

}
