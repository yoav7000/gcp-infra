resource "google_compute_instance" "bastion" {
  name         = "${var.name_prefix}-bastion"
  machine_type = var.bastion_machine_type
  zone         = var.zone
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
  name         = "${var.name_prefix}-k3s"
  machine_type = var.k3s_machine_type
  zone         = var.zone
  tags         = [local.k3s_tag]

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
      size  = var.k3s_disk_gb
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
