variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Value of the tags"
}

variable "oidc" {
  type        = string
  description = "URL from OIDC providee of the EKS cluster"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}
