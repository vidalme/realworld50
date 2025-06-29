data "aws_availability_zones" "available" {
  state         = "available"
  exclude_names = ["us-west-2a", "us-west-2c"] # Exclude a specific AZ if needed
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0" # Use a newer version

  # vpc details
  name            = "vpc-${local.project_name}"
  azs             = data.aws_availability_zones.available.names
  cidr            = var.vpc_cidr_block
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # database subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  # NAT gateways - outbound internet access
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags     = local.common_tags
  vpc_tags = local.common_tags

  public_subnet_tags = {
    Type                                              = "Public Subnets"
    "kubernetes.io/role/elb"                          = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  private_subnet_tags = {
    Type                                              = "Private Subnets"
    "kubernetes.io/role/elb"                          = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  database_subnet_tags = {
    Type = "Database Subnets"
  }

  #instances launched in the public subnets will have public IPs
  map_public_ip_on_launch = true
}