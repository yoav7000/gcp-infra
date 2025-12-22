locals {
  vpc_name = "${var.name_prefix}-vpc"

  public_subnet_name  = "${var.name_prefix}-public-subnet"
  private_subnet_name = "${var.name_prefix}-private-subnet"

  bastion_tag = "${var.name_prefix}-bastion"
  k3s_tag     = "${var.name_prefix}-k3s"

  ssh_key_line = "${var.ssh_user}:${trimspace(file(var.ssh_public_key_path))}"
}
