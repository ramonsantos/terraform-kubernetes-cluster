resource "kubernetes_service_account" "lt_eks_controller_sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "esk.amazonaws.com/role-arn" = aws_iam_role.lt_eks_controller_role.arn
    }
  }
}
