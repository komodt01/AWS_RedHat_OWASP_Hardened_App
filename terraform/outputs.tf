output "web_instance_public_ip" {
  description = "Public IP address of the hardened web server."
  value       = aws_instance.web.public_ip
}

output "web_instance_public_dns" {
  description = "Public DNS name of the hardened web server."
  value       = aws_instance.web.public_dns
}

output "security_group_id" {
  description = "ID of the web security group."
  value       = aws_security_group.web_sg.id
}
