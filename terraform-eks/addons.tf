module "eks_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.0"

  # Cluster information
  cluster_name      = module.wanderlust_eks.cluster_name
  cluster_endpoint  = module.wanderlust_eks.cluster_endpoint
  cluster_version   = module.wanderlust_eks.cluster_version
  oidc_provider_arn = module.wanderlust_eks.oidc_provider_arn
}
