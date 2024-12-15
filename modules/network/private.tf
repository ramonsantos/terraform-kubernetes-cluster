resource "aws_subnet" "kc_subnet_private_1a" {
  vpc_id            = aws_vpc.kc_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"
  tags = merge(
    var.tags,
    {
      Name                              = "lt-private-subnet-1a"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "kc_subnet_private_1b" {
  vpc_id            = aws_vpc.kc_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"
  tags = merge(
    var.tags,
    {
      Name                              = "lt-private-subnet-1b"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_route_table_association" "kc_private_subnet_1a_association" {
  subnet_id      = aws_subnet.kc_subnet_private_1a.id
  route_table_id = aws_route_table.kc_private_route_table_1a.id
}

resource "aws_route_table_association" "kc_private_subnet_1b_association" {
  subnet_id      = aws_subnet.kc_subnet_private_1b.id
  route_table_id = aws_route_table.kc_private_route_table_1b.id
}
