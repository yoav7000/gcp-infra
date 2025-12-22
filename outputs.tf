output "bastion_public_ip" {
  value       = google_compute_instance.bastion.network_interface[0].access_config[0].nat_ip
  description = "Public IP to SSH into the bastion"
}

output "bastion_private_ip" {
  value       = google_compute_instance.bastion.network_interface[0].network_ip
  description = "Private IP of bastion inside the VPC"
}

output "k3s_private_ip" {
  value       = google_compute_instance.k3s.network_interface[0].network_ip
  description = "Private IP of the k3s node"
}
