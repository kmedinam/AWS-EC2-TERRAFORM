# Creates a EC2 Instance
resource "aws_instance" "UBUNTU" {
    ami                         = "ami-097a2df4ac947655f"
    instance_type               = "t2.micro"
    iam_instance_profile        = "EC2-SSM-Role"
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.PUB-2A.id

    depends_on = [
      aws_internet_gateway.kme-igt
    ]

    tags = {
      Name = "UBUNTU"
    }
}
