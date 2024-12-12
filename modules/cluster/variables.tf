variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Value of the tags"
}

variable "public_subnet_1a" {
  type        = string
  description = "Subnet to create EKS cluster AZ 1a"
}

variable "plublic_subnet_1b" {
  type        = string
  description = "Subnet to create EKS cluster AZ 1b"
}
