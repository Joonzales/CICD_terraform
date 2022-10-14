output "dns-name" {
  description = "ALB DNS Address"
  value       = aws_alb.alb.dns_name
}
output "bastion" {
  description = "Bastion Host IP "
  value       = aws_instance.ec2.public_ip
}
