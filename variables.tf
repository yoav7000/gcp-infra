variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "GCP zone"
  default     = "us-central1-a"
}

variable "name_prefix" { # TODO: check if needed
  type        = string
  description = "Name prefix for resources"
  default     = "airis-core"
}

variable "admin_cidr" { #TODO: check if needed or use 0.0.0.0/0
  type        = string
  description = "Your public IP in CIDR format for SSH to bastion, e.g. 203.0.113.4/32"
}

variable "private_subnet_cidr" {
    type        = string
    description = "CIDR range for the private subnet"
}

variable "public_subnet_cidr" {
    type        = string
    description = "CIDR range for the public subnet"
}

variable "ssh_user" {
  type        = string
  description = "Linux user for SSH keys metadata"
  default     = "fde"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to your SSH public key, e.g. ~/.ssh/id_ed25519.pub"
}

variable "bastion_machine_type" {
  type        = string
  description = "Bastion machine type"
  default     = "e2-micro"
}

variable "k3s_machine_type" {
  type        = string
  description = "K3s VM machine type"
  default     = "e2-medium"
}

variable "k3s_disk_gb" {
  type        = number
  description = "Boot disk size for K3s VM"
  default     = 20
}
