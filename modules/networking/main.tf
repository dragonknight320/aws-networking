resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"



  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}