data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  # Cluster configuration with unique suffix to avoid conflicts
  cluster_name = "${var.cluster_name}-${random_string.suffix.result}"

  # Network configuration
  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 10)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
}
