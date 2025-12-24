resource "google_compute_instance" "bastion" {
  name         = "${local.name_prefix}-bastion"
  machine_type = local.bastion_machine_type
  zone         = local.zone
  tags         = [local.bastion_tag]

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public-subnet.id
    access_config {}
  }

  metadata = {
    "ssh-keys" = local.ssh_key_line
  }
}

resource "google_compute_instance" "k3s" {
  name         = "${local.name_prefix}-k3s"
  machine_type = local.k3s_machine_type
  zone         = local.zone
  tags         = [local.k3s_tag]

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
      size  = 20
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private-subnet.id
    # no access_config, stays private, still gets internet via Cloud NAT
  }

  metadata = {
    "ssh-keys" = local.ssh_key_line
  }
}
