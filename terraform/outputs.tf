output "instance_public_ip" {
  value = aws_instance.infra_zero_ec2.public_ip
}


/*
output "private_key" {
  value     = tls_private_key.infra_zero_key.private_key_pem
  sensitive = true
}
*/