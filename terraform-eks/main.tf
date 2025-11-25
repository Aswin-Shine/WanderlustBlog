# EKS CLUSTER VPC

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${module.eks.name}-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true
  single_nat_gateway = var.enable_single_nat_gateway
  create_igw         = true


  manage_default_network_acl    = true
  default_network_acl_tags      = { Name = "${module.eks.name}-default-nacl" }
  manage_default_route_table    = true
  default_route_table_tags      = { Name = "${module.eks.name}-default-rt" }
  manage_default_security_group = true
  default_security_group_tags   = { Name = "${module.eks.name}-default-sg" }


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

#EKS ClUSTER

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "wanderlustCluster"
  kubernetes_version = "1.33"

  # Optional
  endpoint_public_access  = true
  endpoint_private_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # Create just the IAM resources for EKS Auto Mode for use with custom node pools
  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # KMS configuration to avoid conflicts
  create_kms_key                  = true
  kms_key_description             = "EKS cluster ${name} encryption key"
  kms_key_deletion_window_in_days = 7

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
