#vpc creation
resource "aws_vpc" "main-vpc" {
  cidr_block       = var.cidr
  enable_dns_hostnames = var.dns-hostname[0]
  enable_dns_support = var.dns-support[0]

  tags = {
    Name = var.name[0]
  }
}
#subnets creation


resource "aws_subnet" "main-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.subnetcidr[count.index]
  count = length(var.subnetcidr)
  
  tags = {
    Name = "Main-Subnet"
  }
}


#IGW creation
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "main-igw"
  }
}


#create route for IGW

resource "aws_route_table" "route2igw" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#associate public subnets to the route

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main-subnet[0].id
  route_table_id = aws_route_table.route2igw.id
}


#splat
output "subnetid1" {
  value = aws_subnet.main-subnet[*].id
}
