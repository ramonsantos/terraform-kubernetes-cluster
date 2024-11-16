resource "aws_internet_gateway" "lt_igw" {
  vpc_id = aws_vpc.lt_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}

resource "aws_route_table" "lt_public_route_table" {
  vpc_id = aws_vpc.lt_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lt_igw.id
  }

  tags = {
    Name = "${var.project_name}-public-route-table"
  }
}
