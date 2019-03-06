#AWS provider
provider "aws" {
  region     = "${var.aws_region}"
}

#aws vpc cidr block
resource "aws_vpc" "main" {
  cidr_block = "${var.aws_vpc}"
  enable_dns_hostnames = true
  tags {
    Name = "VPC"
  }
}

#internet gateway
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.main.id}"
    tags {
     Name = "Internet Gateway"
    }
}

#elasticip(EIP) which is natting to Nat gateway
resource "aws_eip" "nat-1a" {
    vpc = true
}

resource "aws_eip" "nat-1b" {
    vpc = true
}

#Nat gateway to connect internet from private subnets
resource "aws_nat_gateway" "ap-south-1a" {
  allocation_id = "${aws_eip.nat-1a.id}"
  subnet_id     = "${aws_subnet.ap-south-1a-public.id}"
  tags {
   Name = "Nat Gateway-ap-south-1a"
  }
  depends_on = ["aws_internet_gateway.default"]
}

resource "aws_nat_gateway" "ap-south-1b" {
  allocation_id = "${aws_eip.nat-1b.id}"
  subnet_id     = "${aws_subnet.ap-south-1b-public.id}"
  tags {
   Name = "Nat Gateway-ap-south-1b"
  }
  depends_on = ["aws_internet_gateway.default"]
}

#Public Subnet
resource "aws_subnet" "ap-south-1a-public" {
    vpc_id = "${aws_vpc.main.id}"

    cidr_block = "${var.public_subnet_cidr1}"
    availability_zone = "ap-south-1a"

    tags {
        Name = "Public-Subnet-1a"
    }
}


resource "aws_subnet" "ap-south-1b-public" {
    vpc_id = "${aws_vpc.main.id}"

    cidr_block = "${var.public_subnet_cidr2}"
    availability_zone = "ap-south-1b"

    tags {
        Name = "Public-Subnet-1b"
    }
}

#Route table mapping with igw
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public-Route-Table"
    }
}

#Associate route table with public subnets
resource "aws_route_table_association" "ap-south-1a-public" {
    subnet_id = "${aws_subnet.ap-south-1a-public.id}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "ap-south-1b-public" {
    subnet_id = "${aws_subnet.ap-south-1b-public.id}"
    route_table_id = "${aws_route_table.public.id}"
}


# Private Subnets
resource "aws_subnet" "ap-south-1a-private" {
    vpc_id = "${aws_vpc.main.id}"

    cidr_block = "${var.private_subnet_cidr1}"
    availability_zone = "ap-south-1a"

    tags {
        Name = "Private-Subnet-1a"
    }
}

resource "aws_subnet" "ap-south-1b-private" {
    vpc_id = "${aws_vpc.main.id}"

    cidr_block = "${var.private_subnet_cidr2}"
    availability_zone = "ap-south-1b"

    tags {
        Name = "Private-Subnet-1b"
    }
}

#route table
resource "aws_route_table" "private-route-1a" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.ap-south-1a.id}"
    }

    tags {
        Name = "Private-Route-1a"
    }
}

resource "aws_route_table" "private-route-1b" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.ap-south-1b.id}"
    }

    tags {
        Name = "Private-Route-1b"
    }
}

#Associate route table with private subnets
resource "aws_route_table_association" "ap-south-1a-private" {
    subnet_id = "${aws_subnet.ap-south-1a-private.id}"
    route_table_id = "${aws_route_table.private-route-1a.id}"
}

resource "aws_route_table_association" "ap-south-1b-private" {
    subnet_id = "${aws_subnet.ap-south-1b-private.id}"
    route_table_id = "${aws_route_table.private-route-1b.id}"
}

