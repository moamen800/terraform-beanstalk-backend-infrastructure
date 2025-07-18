# ===================================
# VPC NETWORK CONFIGURATION
# ===================================

# Main VPC Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "${var.project_name}-vpc"
  cidr = var.vpc_cidr

  # Availability Zones & Subnets
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  # DNS Configuration
  enable_dns_hostnames = true
  enable_dns_support   = true

  # NAT Gateway Configuration - Single NAT for cost optimization
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # Public IP Configuration
  map_public_ip_on_launch = true

  # Common Tags
  tags = {
    Environment = var.environment
    Project     = var.project_name
    Terraform   = "true"
  }

  # Subnet-specific Tags
  public_subnet_tags = {
    Type = "Public"
  }

  private_subnet_tags = {
    Type = "Private"
  }
}
