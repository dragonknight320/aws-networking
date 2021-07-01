//Ip for NAT gateway
resource "aws_eip" "nat" {
  # count = 3

  vpc = true
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "davidle"
  cidr = var.cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway  = true
  single_nat_gateway  = true
  reuse_nat_ips       = true           # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = "${aws_eip.nat.*.id}" # <= IPs specified here as input to the module

  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

