# Data source pro nejnovější Amazon Linux 2
data "aws_ami" "amazon_linux_2" {
  count       = var.ami_id == "" ? 1 : 0  # když je ami_id prázdné, hledej AMI
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Vyber AMI – buď z var.ami_id, nebo z data source
locals {
  effective_ami_id = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux_2[0].id
}

resource "aws_instance" "ec2_tw" {
  ami           = local.effective_ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = var.instance_name
  }
}