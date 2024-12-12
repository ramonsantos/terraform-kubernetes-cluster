variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Value of the tags"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "private_subnet_1a" {
  type        = string
  description = "ID of the private subnet in the first Availability Zone"
}

variable "private_subnet_1b" {
  type        = string
  description = "ID of the private subnet in the second Availability Zone"
}
