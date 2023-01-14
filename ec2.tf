#ec2
resource "aws_instance" "ec2" {
  
  ami = var.ami_id["linux"]
  instance_type = "t3.micro"
  count = length(var.subnetcidr)
  subnet_id = aws_subnet.main-subnet[count.index].id
  security_groups = [aws_security_group.sg.id]

  tags = {
    Name = "main-ec2"
  }
}
