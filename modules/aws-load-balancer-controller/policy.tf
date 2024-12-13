resource "aws_iam_policy" "lt_eks_controller_policy" {
  name   = "${var.project_name}-lt-eks-controller-policy"
  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}
