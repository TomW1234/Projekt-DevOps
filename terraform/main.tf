
provider "aws" {
  region = var.aws_region_ec2
}

resource "tls_private_key" "ec2_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_ssh" {
  key_name   = "${var.instance_name_ec2}-key"
  public_key = tls_private_key.ec2_ssh.public_key_openssh
}

resource "local_file" "ec2_private_key" {
  content         = tls_private_key.ec2_ssh.private_key_pem
  filename        = "${path.module}/${var.instance_name_ec2}-key.pem"
  file_permission = "0600"
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id_ec2
  instance_type = var.instance_type_ec2
  instance_name = var.instance_name_ec2
  key_name      = aws_key_pair.ec2_ssh.key_name
}