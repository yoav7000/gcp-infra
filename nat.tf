resource "google_compute_router" "router" {
  name    = "${local.name_prefix}-router"
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat" {
  name   = "${local.name_prefix}-nat"
  router = google_compute_router.router.name

  nat_ip_allocate_option = "AUTO_ONLY" # Allocate NAT external IPs automatically

  # This option allows specifying which subnetworks to use in NAT in the next subnetwork block.
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.private-subnet.id
    source_ip_ranges_to_nat  = ["ALL_IP_RANGES"]
  }
}
