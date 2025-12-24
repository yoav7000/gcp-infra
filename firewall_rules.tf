resource "google_compute_firewall" "allow_ssh_to_bastion" {
  name    = "${var.name_prefix}-allow-ssh-to-bastion"
  network = google_compute_network.vpc.name

  direction     = "INGRESS"
  priority      = 1000
  source_ranges = [var.admin_cidr]
  target_tags   = [local.bastion_tag]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_bastion_to_k3s_ssh" {
  name    = "${var.name_prefix}-allow-bastion-to-k3s-ssh"
  network = google_compute_network.vpc.name

  direction   = "INGRESS"
  priority    = 1000
  source_tags = [local.bastion_tag]
  target_tags = [local.k3s_tag]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
