#security group
resource "aws_security_group" "sg" {
  description = "Allow inbound traffic to EC2 from VPC block"
  name        = "dynamic-sg"
  vpc_id = aws_vpc.main-vpc.id
  dynamic "ingress" {
    for_each = var.port-sg
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
