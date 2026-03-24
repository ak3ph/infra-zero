# Security Group
resource "aws_security_group" "infra_zero_sg" {
  name        = "infra-zero-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Key Pair
resource "tls_private_key" "infra_zero_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "infra_zero_key" {
  key_name   = "infra-zero-key"
  public_key = tls_private_key.infra_zero_key.public_key_openssh
}

# EC2 Instance
resource "aws_instance" "infra_zero_ec2" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.infra_zero_sg.id]
  key_name               = aws_key_pair.infra_zero_key.key_name

  user_data = file("setup.sh")

  tags = {
    Name = "infra-zero-ec2"
  }
}