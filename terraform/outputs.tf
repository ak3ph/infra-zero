output "instance_public_ip" {
  value = aws_instance.infra_zero_ec2.public_ip
}