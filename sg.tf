#security group
resource "aws_security_group" "sg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"
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
