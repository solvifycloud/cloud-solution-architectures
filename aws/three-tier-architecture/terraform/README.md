# Explanation of Outputs

- **load_balancer_dns_name**

Outputs the DNS name of the Application Load Balancer (ALB). This is what you would use to access the web application from a browser.

- **vpc_id**

Outputs the ID of the VPC that was created. This can be useful for referencing the VPC in other configurations or modules.

- **public_subnet_id & private_subnet_id**

Outputs the IDs of the public and private subnets. These are useful if you need to deploy additional resources to specific subnets.

- **web_security_group_id & db_security_group_id**

Outputs the IDs of the security groups created for the web server and the RDS database, respectively. This is useful for auditing or adding more rules to these security groups in future updates.

- **web_server_public_ip**

Outputs the public IP address of the EC2 instance running the web server. This is useful if you need direct access to the web server (e.g., for SSH access).

- **db_endpoint**

Outputs the endpoint of the RDS MySQL database. This is used to connect to the database from your application or a database management tool.
