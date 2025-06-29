locals {
  project_name = "${var.project_name}-${var.environment}"
  common_tags = {
    Owner       = var.owner
    Environment = var.environment
    Project     = local.project_name
  }
  eks_cluster_name = "${local.project_name}-cluster"
}