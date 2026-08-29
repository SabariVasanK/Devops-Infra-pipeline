variable "env" {
  type        = string
  description = "what type of environment"
}
variable "vpc_cidr"{
  type        = string
  description = "VPC cidr"
}
variable "subnet_cidr"{
  type        = string
  description = "Subnet cidr"
}
variable "subnet_az" {
  type        = string
  description = "AZ of Subnet"
}
