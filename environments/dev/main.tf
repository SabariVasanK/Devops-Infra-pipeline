module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  subnet_az   = "${var.aws_region}a"
  env         = "dev"
}

module "ec-2" {
  source    = "../../modules/ec2"
  ami_id    = "ami-0332d564d76dbd8d6"
  ec2_type  = "t2.micro"
  sub_id    = module.vpc.subnet_id
  count_ec2 = 1
  env       = "dev"
}