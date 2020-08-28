output "bastion-instance-ip" {
  value = aws_instance.bastion.public_ip
}

output "private-instance-ip" {
  value = aws_instance.private-inst.private_ip
}