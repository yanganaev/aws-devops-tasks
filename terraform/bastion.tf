resource "aws_instance" "bastion" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2 us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name                    = "your-key-name" # Your Key

  tags = {
    Name = "bastion-${var.env_suffix}"
  }
}
