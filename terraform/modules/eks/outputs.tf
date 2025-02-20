output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "private_node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_eks_node_group.eks_private_node_group.node_group_name
}

output "public_node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_eks_node_group.eks_public_node_group.node_group_name
}
