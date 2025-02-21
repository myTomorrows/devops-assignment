output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_eks_node_group.eks_node_group.node_group_name
}

output "cluster_ca_certificate" {
  description = "Certificate to Connect"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
