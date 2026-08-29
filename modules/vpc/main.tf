resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.env} VPC"
    Env  = var.env
  }
}

resource "aws_subnet" "main-sub" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnet_cidr # ✅ fixed
  availability_zone = var.subnet_az

  tags = {
    Name = "${var.env} Subnet"
    Env  = var.env
  }
}

output "subnet_id" {
  value       = aws_subnet.main-sub.id
  description = "subnet-id from vpc creation"
}