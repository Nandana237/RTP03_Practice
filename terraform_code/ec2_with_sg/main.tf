provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "ec2" {
    ami = "ami-06ca3ca175f37dd66"
    instance_type = "t2.micro"
    key_name = "Darsh"
    tags={
    "Name":"tf_server"}
    security_groups = ["rtp03-sg"]
  }
resource "aws_security_group" "rtp03-sg" {
    name = "rtp03-sg"
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
