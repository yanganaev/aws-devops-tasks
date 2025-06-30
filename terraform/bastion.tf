resource "aws_instance" "bastion" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2, пример
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true
  key_name                    = "your-keypair"

  tags = {
    Name = "${var.project_name}-bastion"
  }

  vpc_security_group_ids = [aws_security_group.bastion.id]
}
