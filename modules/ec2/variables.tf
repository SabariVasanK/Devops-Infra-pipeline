variable "ami_id" {
  type        = string
  description = "Ami Id of EC2"
}
variable "ec2_type" { # ✅ renamed from ec2-type
  type        = string
  default     = ""
  description = "Instance type of ec2"
}
variable "sub_id" {
  type        = string
  description = "Subnet id of EC2"
}
variable "count_ec2" {
  type        = number # better as number, string will auto-convert but number is correct
  description = "Num of EC2"
}
variable "env" {
  type        = string
  default     = ""
  description = "what type of environment"
}