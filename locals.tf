locals {
  name_prefix = "airis-core"
  project_id = "yoav-six-seven"
  region = "us-central1"
  zone = "us-central1-a"

  admin_cidr = "0.0.0.0/0" # CHANGE TO YOUR IP FOR PRODUCTION
  public_subnet_cidr = "10.100.1.0/24"
  private_subnet_cidr = "10.100.2.0/24"

  ssh_public_key_path = "C:\\YoavWork/new-gcp-keys.pub"
  ssh_user = "yoav"
  bastion_machine_type = "e2-micro"
  k3s_machine_type = "e2-medium"

  vpc_name = "${local.name_prefix}-vpc"

  public_subnet_name  = "${local.name_prefix}-public-subnet"
  private_subnet_name = "${local.name_prefix}-private-subnet"

  bastion_tag = "${local.name_prefix}-bastion"
  k3s_tag     = "${local.name_prefix}-k3s"

  ssh_key_line = "${local.ssh_user}:${trimspace(file(local.ssh_public_key_path))}"
}
