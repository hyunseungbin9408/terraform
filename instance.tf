resource "aws_instance" "example1" {
    ami         = var.AMI_IMAGES[var.AWS_REGION]
    instance_type = "t2.micro"
}