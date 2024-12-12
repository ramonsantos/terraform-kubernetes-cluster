output "lt-vpc-config" {
  value = module.lt_eks_cluster.lt_eks_vpc_config
}

output "oidc" {
  value = module.lt_eks_cluster.oidc
}
