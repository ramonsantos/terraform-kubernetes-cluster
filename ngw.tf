resource "aws_eip" "lt_igw_eip_1a" {
  domain = "vpc"
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "lt_igw_eip_1b" {
  domain = "vpc"
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

resource "aws_nat_gateway" "lt_ngw_1a" {
  allocation_id = aws_eip.lt_igw_eip_1a.id
  subnet_id     = aws_subnet.lt_public_subnet_1a.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

resource "aws_nat_gateway" "lt_ngw_1b" {
  allocation_id = aws_eip.lt_igw_eip_1b.id
  subnet_id     = aws_subnet.lt_public_subnet_1b.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}

resource "aws_route_table" "lt_private_route_table_1a" {
  vpc_id = aws_vpc.lt_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lt_ngw_1a.id
  }

  tags = {
    Name = "${var.project_name}-private-route-table-1a"
  }
}

resource "aws_route_table" "lt_private_route_table_1b" {
  vpc_id = aws_vpc.lt_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lt_ngw_1b.id
  }

  tags = {
    Name = "${var.project_name}-private-route-table-1b"
  }
}
