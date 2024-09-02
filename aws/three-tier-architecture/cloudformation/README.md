## CloudFormation Template for 3-Tier Architecture

### Overview
This AWS CloudFormation template defines a 3-Tier Architecture consisting of a Virtual Private Cloud (VPC), subnets, security groups, an EC2 instance (Web Server), an RDS MySQL Database, and an Application Load Balancer (ALB). This architecture is designed to be scalable, secure, and easy to manage.

### Components

1. **VPC (Virtual Private Cloud)**
   - A logically isolated section of the AWS cloud where you can launch AWS resources in a virtual network that you define.

2. **Subnets**
   - **Public Subnet:** Hosts the EC2 instance (Web Server) that is accessible from the internet.
   - **Private Subnet:** Hosts the RDS MySQL Database, which is not directly accessible from the internet.

3. **Internet Gateway**
   - Enables the VPC to connect to the internet, allowing resources in the public subnet to send and receive traffic from the internet.

4. **Route Table**
   - **Public Route Table:** Routes internet-bound traffic from the public subnet through the Internet Gateway.

5. **Security Groups**
   - **Web Server Security Group:** Allows HTTP (port 80) and SSH (port 22) traffic to the Web Server.
   - **Database Security Group:** Allows MySQL traffic (port 3306) from the Web Server's security group to the RDS MySQL Database.

6. **EC2 Instance (Web Server)**
   - A virtual server that hosts the application frontend and handles incoming HTTP requests. It is deployed in the public subnet and is associated with the Web Server Security Group.

7. **RDS MySQL Database**
   - A managed relational database service that is deployed in the private subnet. It is secured by the Database Security Group and only allows access from the Web Server.

8. **Application Load Balancer (ALB)**
   - Distributes incoming HTTP traffic across multiple EC2 instances (Web Servers) to ensure high availability. The ALB is placed in front of the Web Server in the public subnet.

### Outputs

1. **LoadBalancerDNSName**
   - The DNS name of the Application Load Balancer, which you can use to access the web application.

2. **VPC ID**
   - The ID of the VPC created by the template.

3. **Public Subnet ID**
   - The ID of the public subnet where the Web Server is deployed.

4. **Private Subnet ID**
   - The ID of the private subnet where the RDS MySQL Database is deployed.

5. **Web Security Group ID**
   - The ID of the security group attached to the Web Server.

6. **Database Security Group ID**
   - The ID of the security group attached to the RDS MySQL Database.

7. **Web Server Public IP**
   - The public IP address of the EC2 instance running the Web Server.

8. **Database Endpoint**
   - The connection endpoint of the RDS MySQL Database, used to connect to the database from the application.

### Usage
To deploy this CloudFormation template:

1. Save the YAML content into a file (e.g., `3-tier-architecture.yaml`).
2. Open the AWS Management Console.
3. Navigate to CloudFormation and create a new stack.
4. Upload the `3-tier-architecture.yaml` file.
5. Follow the prompts to configure any required parameters and deploy the stack.

This template sets up a fully functional 3-Tier Architecture with networking elements on AWS, suitable for scalable, secure, and highly available applications.
