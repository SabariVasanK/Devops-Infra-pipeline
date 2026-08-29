module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = "10.2.0.0/16"
  subnet_cidr = "10.2.1.0/24"
  subnet_az   = "${var.aws_region}a"
  env         = "prod"
}

module "ec-2" {
  source    = "../../modules/ec2"
  ami_id    = "ami-0332d564d76dbd8d6"
  ec2_type  = "t2.small"
  sub_id    = module.vpc.subnet_id
  count_ec2 = 2
  env       = "prod"
}