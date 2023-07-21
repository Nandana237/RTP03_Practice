########################################################################
# Creating EC2 Instance
########################################################################
resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key-name
    associate_public_ip_address = var.associate_ip
    vpc_security_group_ids = ["${aws_security_group.rtp03-sg.id}"]
    subnet_id = "${aws_subnet.rtp03-public_subnet_01.id}"
    for_each = toset(["jenkins-master", "jenkins-slave"])
    tags = {
      Name = "${each.key}"
    }
}
