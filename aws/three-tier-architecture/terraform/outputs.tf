# Outputs the DNS name of the Application Load Balancer
output "load_balancer_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

# Outputs the ID of the VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

# Outputs the ID of the Public Subnet
output "public_subnet_id" {
  description = "The ID of the Public Subnet"
  value       = aws_subnet.public_subnet.id
}

# Outputs the ID of the Private Subnet
output "private_subnet_id" {
  description = "The ID of the Private Subnet"
  value       = aws_subnet.private_subnet.id
}

# Outputs the ID of the Web Server Security Group
output "web_security_group_id" {
  description = "The ID of the Security Group for the Web Server"
  value       = aws_security_group.web_sg.id
}

# Outputs the ID of the Database Security Group
output "db_security_group_id" {
  description = "The ID of the Security Group for the RDS Database"
  value       = aws_security_group.db_sg.id
}

# Outputs the Public IP of the Web Server EC2 instance
output "web_server_public_ip" {
  description = "The Public IP address of the Web Server EC2 instance"
  value       = aws_instance.web.public_ip
}

# Outputs the Endpoint of the RDS Database
output "db_endpoint" {
  description = "The connection endpoint of the RDS MySQL Database"
  value       = aws_db_instance.db.endpoint
}
