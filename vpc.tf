provider "aws" {
  region = "us-east-1"
}
//main vpc resource configuraton

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
//Public Subnet & Cidr Notation 

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

//internet gatrway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

//route table 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
//routes
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

//instance

resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
}