variable "cidr_block" {
  type        = string
  description = "Value of the CIDR block"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type = map
  description = "Value of the tags"
}
