module "kc_network" {
  source       = "./modules/network"
  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = local.tags
}

module "kc_eks_cluster" {
  source            = "./modules/cluster"
  project_name      = var.project_name
  tags              = local.tags
  public_subnet_1a  = module.kc_network.public_subnet_1a
  plublic_subnet_1b = module.kc_network.public_subnet_1b
}

module "kc_eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.kc_eks_cluster.cluster_name
  private_subnet_1a = module.kc_network.private_subnet_1a
  private_subnet_1b = module.kc_network.private_subnet_1b
  tags              = local.tags
}

module "kc_eks_controller_policy" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.kc_eks_cluster.oidc
  cluster_name = module.kc_eks_cluster.cluster_name
}
