resource "aws_eks_node_group" "lt_eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodegroup"
  node_role_arn   = aws_iam_role.lt_eks_mng_role.arn
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks-mng"
    }
  )

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.lt_eks_mng_role_attachment_worker,
    aws_iam_role_policy_attachment.lt_eks_mng_role_attachment_ecr,
    aws_iam_role_policy_attachment.lt_eks_mng_role_attachment_cni
  ]
}
