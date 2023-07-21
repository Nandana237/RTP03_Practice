variable "ami" {
    default = "ami-06ca3ca175f37dd66"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "key-name" {
    default = "Darsh"
}
variable "vpc_cidr" {
    default = "10.0.0.0/24"
}
variable "subnet_cidr" {
    default = "10.0.0.0/25"
}
