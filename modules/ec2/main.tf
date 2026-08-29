resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.ec2_type
  subnet_id =var.sub_id
  count =var.count_ec2

  tags = {
    Name = "${var.env} ec-2-${count.index}"
    Env=var.env
  }
}