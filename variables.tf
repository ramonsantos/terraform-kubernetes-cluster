variable "cidr_block" {
  type        = string
  description = "Value of the CIDR block"
  default     = "10.0.0.0/16"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "terraform-kubernetes-cluster"
}
