########################################################################
# Creating VPC
########################################################################
resource "aws_vpc" "rtp03-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "rpt03-vpc"
    }
 }
########################################################################
# Creating Subnet_01
########################################################################
resource "aws_subnet" "rtp03-public_subnet_01" {
    vpc_id = "${aws_vpc.rtp03-vpc.id}"
    cidr_block = var.subnet_cidr
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags = {
      Name = "rtp03-public_subnet_01"
    }
}
########################################################################
# Creating IGW
########################################################################
resource "aws_internet_gateway" "rtp03-igw" {
    vpc_id = "${aws_vpc.rtp03-vpc.id}"
    tags = {
      Name = "rtp03-igw"
    }
}
########################################################################
# Creating Route Table
########################################################################
resource "aws_route_table" "rtp03-public-rt" {
    vpc_id = "${aws_vpc.rtp03-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.rtp03-igw.id}"
    }
    tags = {
      Name = "rtp03-public-rt"
    }
}
########################################################################
# Associating subnet with Route Table
########################################################################
resource "aws_route_table_association" "rtp03-rta-public-subnet-1" {
    subnet_id = "${aws_subnet.rtp03-public_subnet_01.id}"
    route_table_id = "${aws_route_table.rtp03-public-rt.id}"
}
