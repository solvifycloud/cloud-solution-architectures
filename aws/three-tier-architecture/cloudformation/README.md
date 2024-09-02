# Explanation of the Template

## VPC and Subnets

VPC: A Virtual Private Cloud where all resources are deployed.
Subnets: Two subnets are created, one public (for the web server) and one private (for the database).

## Internet Gateway and Routing

Internet Gateway: Allows the VPC to communicate with the internet.
Route Table: Routes traffic from the public subnet to the internet via the Internet Gateway.

## Security Groups

WebServerSecurityGroup: Allows HTTP (port 80) and SSH (port 22) access to the web server.
DatabaseSecurityGroup: Restricts access to the MySQL database (port 3306) to only the web server.

## EC2 Instance (Web Server)

WebServerInstance: A t2.micro instance running the web server, placed in the public subnet and associated with the WebServerSecurityGroup.

## RDS Instance (MySQL Database)

MySQLDatabase: An RDS MySQL instance for the database tier, associated with the DatabaseSecurityGroup and placed in the private subnet.

## Application Load Balancer (ALB)

LoadBalancer: Distributes incoming HTTP traffic across multiple EC2 instances.
Listener and Target Group: Configures the ALB to listen for HTTP traffic on port 80 and forward it to the EC2 instances.

## Outputs

- **LoadBalancerDNSName**: Provides the DNS name of the Load Balancer as an output, which you can use to access your web application.

## Usage

To deploy this CloudFormation template:

- Save the YAML content into a file (e.g., 3-tier-architecture.yaml).
- Open the AWS Management Console.
- Navigate to CloudFormation and create a new stack.
- Upload the 3-tier-architecture.yaml file.
- Follow the prompts to configure any required parameters and deploy the stack.
