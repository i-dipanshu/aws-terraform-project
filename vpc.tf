module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.VPC_NAME
  cidr = var.VPC_CIDR

  azs             = [var.ZONE_1, var.ZONE_1, var.ZONE_1]
  public_subnets  = [var.PUBLIC_SUBNET_1, var.PUBLIC_SUBNET_2, var.PUBLIC_SUBNET_3]
  private_subnets = [var.PRIVATE_SUBNET_1, var.PRIVATE_SUBNET_2, var.PRIVATE_SUBNET_3]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}