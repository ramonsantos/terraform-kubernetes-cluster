resource "aws_subnet" "kc_public_subnet_1a" {
  vpc_id                  = aws_vpc.kc_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name                     = "lt-public-subnet-1a"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "kc_public_subnet_1b" {
  vpc_id                  = aws_vpc.kc_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name                     = "lt-public-subnet-1b"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "kc_public_subnet_1a_association" {
  subnet_id      = aws_subnet.kc_public_subnet_1a.id
  route_table_id = aws_route_table.kc_public_route_table.id
}

resource "aws_route_table_association" "kc_public_subnet_1b_association" {
  subnet_id      = aws_subnet.kc_public_subnet_1b.id
  route_table_id = aws_route_table.kc_public_route_table.id
}
