resource "aws_subnet" "private_us_east_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-east-1a"
  #   map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "private-us-east-1a"
  }
}

resource "aws_subnet" "private_us_east_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-east-1b"
  #   map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "private-us-east-1b"
  }
}

resource "aws_subnet" "private_us_east_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.64.0/19"
  availability_zone = "us-east-1c"
  #   map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "private-us-east-1c"
  }
}

# public subnet
resource "aws_subnet" "public_us_east_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.96.0/19"
  availability_zone = "us-east-1a"
  #   map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1a"
  }
}

resource "aws_subnet" "public_us_east_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.128.0/19"
  availability_zone = "us-east-1b"
  #   map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1b"
  }
}

resource "aws_subnet" "public_us_east_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.160.0/19"
  availability_zone = "us-east-1c"
  #   map_customer_owned_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1c"
  }
}
