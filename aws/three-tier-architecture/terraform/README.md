### Explanation of the Terraform Code

1. **`aws_vpc`**:
   - **VPC:** Creates a Virtual Private Cloud (VPC) with a specified CIDR block (`10.0.0.0/16`), enabling DNS support and DNS hostnames. This VPC is the networking foundation for your infrastructure.

2. **`aws_subnet`**:
   - **Public Subnet:** Creates a public subnet within the VPC with CIDR block `10.0.1.0/24`, which allows EC2 instances to be assigned public IP addresses for internet access.
   - **Private Subnet:** Creates a private subnet within the VPC with CIDR block `10.0.2.0/24`, designed for resources (like RDS) that do not need direct internet access.

3. **`aws_internet_gateway`**:
   - **Internet Gateway:** Attaches an Internet Gateway to the VPC, allowing resources within the public subnet to communicate with the internet.

4. **`aws_route_table` & `aws_route_table_association`**:
   - **Route Table:** Creates a route table with a route that directs internet-bound traffic from the public subnet to the Internet Gateway.
   - **Route Table Association:** Associates the public subnet with this route table to enable internet access for the public subnet.

5. **`aws_security_group`**:
   - **Web Security Group:** Defines a security group for the web server that allows inbound HTTP (port 80) and SSH (port 22) traffic, and permits all outbound traffic.
   - **Database Security Group:** Defines a security group for the RDS instance, allowing inbound MySQL traffic (port 3306) only from the web server's security group.

6. **`aws_instance`**:
   - **EC2 Instance (Web Server):** Launches an EC2 instance in the public subnet using a specified Amazon Machine Image (AMI) and instance type (`t2.micro`). The instance is associated with the Web Security Group.

7. **`aws_db_instance`**:
   - **RDS Instance (MySQL Database):** Deploys a MySQL RDS instance in the private subnet. The instance is secured by the Database Security Group and uses generated credentials for secure access.

8. **`aws_db_subnet_group`**:
   - **Database Subnet Group:** Defines a subnet group for the RDS instance, ensuring the database is hosted in the private subnet(s).

9. **`aws_lb`**:
   - **Application Load Balancer (ALB):** Creates an internet-facing Application Load Balancer that distributes incoming HTTP traffic across multiple EC2 instances.

10. **`aws_lb_target_group`**:
    - **Target Group:** Defines a target group for the ALB, which will direct traffic to the web server EC2 instances. Includes health checks to monitor the health of instances.

11. **`aws_lb_listener`**:
    - **Listener:** Configures the ALB to listen for HTTP traffic on port 80 and forward it to the target group.

12. **`aws_lb_target_group_attachment`**:
    - **Target Group Attachment:** Attaches the EC2 web server instance to the ALB target group, enabling it to receive traffic from the load balancer.

### Explanation of Outputs

1. **`load_balancer_dns_name`**:
   - Outputs the DNS name of the Application Load Balancer (ALB). This is what you would use to access the web application from a browser.

2. **`vpc_id`**:
   - Outputs the ID of the VPC that was created. This can be useful for referencing the VPC in other configurations or modules.

3. **`public_subnet_id` & `private_subnet_id`**:
   - Outputs the IDs of the public and private subnets. These are useful if you need to deploy additional resources to specific subnets.

4. **`web_security_group_id` & `db_security_group_id`**:
   - Outputs the IDs of the security groups created for the web server and the RDS database, respectively. This is useful for auditing or adding more rules to these security groups in future updates.

5. **`web_server_public_ip`**:
   - Outputs the public IP address of the EC2 instance running the web server. This is useful if you need direct access to the web server (e.g., for SSH access).

6. **`db_endpoint`**:
   - Outputs the endpoint of the RDS MySQL database. This is used to connect to the database from your application or a database management tool.

---

By using these outputs, you can easily access key information about your infrastructure after running `terraform apply`. These outputs are also helpful for integrating your Terraform setup with other systems or automating deployment pipelines.


