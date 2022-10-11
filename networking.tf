# Creates a VPC
resource "aws_vpc" "VPC" {
    cidr_block       = "172.31.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = "VPC"
    }
}

# Creates a Subnets
resource "aws_subnet" "PUB-2A" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = "172.31.0.0/20"
  availability_zone = "us-east-2a"

  tags = {
    Name = "PUB-2A"
  }
}

resource "aws_subnet" "PUB-2B" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = "172.31.16.0/20"
  availability_zone = "us-east-2b"

  tags = {
    Name = "PUB-2B"
  }
}

resource "aws_subnet" "PUB-2C" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = "172.31.32.0/20"
  availability_zone = "us-east-2c"

  tags = {
    Name = "PUB-2C"
  }
}

# Creates a VPC Internet Gateway
resource "aws_internet_gateway" "kme-igt" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    "Name" = "kme-igt"
  }
}