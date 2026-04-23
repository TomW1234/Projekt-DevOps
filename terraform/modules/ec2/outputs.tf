output "instance_id" {
  value = aws_instance.ec2_tw.id
}

output "public_ip" {
  value = aws_instance.ec2_tw.public_ip
}