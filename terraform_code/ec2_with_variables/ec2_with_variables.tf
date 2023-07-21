provider "aws" {
  region = "us-east-1"
}
########################################################################
# Creating EC2 Instance
########################################################################
resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key-name
    tags={
    "Name":"tf_server"}
    vpc_security_group_ids = ["${aws_security_group.rtp03-sg.id}"]
    subnet_id = "${aws_subnet.rtp03-public_subnet_01.id}"
}
########################################################################
# Creating Security Group
########################################################################
resource "aws_security_group" "rtp03-sg" {
    name = "rtp03-sg"
    vpc_id = "${aws_vpc.rtp03-vpc.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "ssh-sg"
    }
}
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
