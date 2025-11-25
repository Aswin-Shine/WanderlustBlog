variable "aws_region" {
  type    = string
  default = "eu-north-1"

}

variable "Environment" {
  type    = string
  default = "dev"
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string
  default     = "1.33"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_single_nat_gateway" {
  description = "Use single NAT gateway to reduce costs (not recommended for production)"
  type        = bool
  default     = true
}

variable "azs" {
  description = "azs"
  type        = string
  default     = ["eu-north-1a", "eu-west-1b"]
}

variable "private_subnets" {
  description = "private_subnets"
  type        = string
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "public_subnets"
  type        = string
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
