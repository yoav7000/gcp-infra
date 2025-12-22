resource "google_compute_network" "vpc" {
  name                    = local.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL" #TODO: check GLOBAL or REGIONAL
}

resource "google_compute_subnetwork" "public-subnet" {
  name          = local.public_subnet_name
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region # TODO: check if needed or use the default region from provider
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private-subnet" {
  name          = local.private_subnet_name
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region # TODO: check if needed or use the default region from provider
  network       = google_compute_network.vpc.id
}
