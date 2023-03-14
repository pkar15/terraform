resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.tf_SG.id]
    subnet_id = var.subnet
    tags = var.tags
    user_data =  "${file("init.sh")}"
}