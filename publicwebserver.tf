resource "aws_security_group" "web" {
  name   = "web-sg"
  vpc_id = aws_vpc.main.id
 //Security Group Configurations(Ingress and Egress)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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

//instance of the web server

resource "aws_instance" "web" {
  ami                         = "ami-xxxxxxxx"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              yum install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF
}
//Layout: Security Group Rules(Ingress + Egress) + Instance Runnign