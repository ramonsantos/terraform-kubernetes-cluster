output "lt_eks_vpc_config" {
  value = aws_eks_cluster.lt_eks_cluster.vpc_config
}

output "oidc" {
  value = data.tls_certificate.lt_eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
}
