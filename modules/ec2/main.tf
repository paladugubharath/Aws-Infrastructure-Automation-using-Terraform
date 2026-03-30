variable "ami_id" {}
variable "key_name" {}
variable "subnet_id" {}
variable "sg_id" {}

resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
}