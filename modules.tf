module "lt_network" {
  source       = "./modules/network"
  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = local.tags
}

module "lt_eks_cluster" {
  source            = "./modules/cluster"
  project_name      = var.project_name
  tags              = local.tags
  public_subnet_1a  = module.lt_network.public_subnet_1a
  plublic_subnet_1b = module.lt_network.public_subnet_1b
}
