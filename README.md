# terraform
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.76.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.16.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.35.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kc_eks_cluster"></a> [kc\_eks\_cluster](#module\_kc\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_kc_eks_controller_policy"></a> [kc\_eks\_controller\_policy](#module\_kc\_eks\_controller\_policy) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_kc_eks_managed_node_group"></a> [kc\_eks\_managed\_node\_group](#module\_kc\_eks\_managed\_node\_group) | ./modules/managed-node-group | n/a |
| <a name="module_kc_network"></a> [kc\_network](#module\_kc\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Value of the CIDR block | `string` | `"10.0.0.0/16"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"terraform-kubernetes-cluster"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
