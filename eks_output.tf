output eks_cluster_arn {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.arn
  sensitive   = true
}

output eks_cluster_id {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.cluster_id
  sensitive   = true
}
