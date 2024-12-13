output "cluster_name" {
  value = aws_eks_cluster.lt_eks_cluster.id
}

output "oidc" {
  value = aws_eks_cluster.lt_eks_cluster.identity[0].oidc[0].issuer
}

output "certificate_authority" {
  value = aws_eks_cluster.lt_eks_cluster.certificate_authority[0].data
}

output "endpoint" {
  value = aws_eks_cluster.lt_eks_cluster.endpoint
}
