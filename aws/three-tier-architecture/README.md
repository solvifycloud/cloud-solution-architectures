3-Tier Architecture
Overview: The 3-tier architecture is a classic design pattern used for many types of applications. It consists of three layers: the presentation layer (frontend), the application layer (backend), and the data layer (database). Each tier is separated, allowing for scalability, flexibility, and manageability.

Components:

Presentation Layer (Frontend):

Amazon S3: Hosts static files like HTML, CSS, and JavaScript. S3 is cost-effective and scalable, making it ideal for hosting static websites.
Amazon CloudFront: Acts as a Content Delivery Network (CDN) to deliver content with low latency by caching files at edge locations close to the user.
Application Layer (Backend):

Amazon EC2: Runs the application logic. EC2 instances can be scaled horizontally using Auto Scaling Groups (ASGs) to handle varying levels of traffic.
Elastic Load Balancer (ELB): Distributes incoming traffic across multiple EC2 instances to ensure reliability and availability.
Data Layer (Database):

Amazon RDS: Provides a managed relational database (e.g., MySQL, PostgreSQL) with automatic backups, replication, and scaling.
Amazon Aurora: A highly performant and scalable database option, which is compatible with MySQL and PostgreSQL.
Scalability & High Availability:

Auto Scaling: Automatically adjusts the number of EC2 instances based on demand.
Multi-AZ RDS: Ensures that the database is highly available by running in multiple availability zones.
Security:

VPC: The entire architecture is deployed within a Virtual Private Cloud (VPC) with public and private subnets. The web servers (EC2) are in the public subnet, and the databases (RDS) are in the private subnet.
Security Groups & NACLs: Fine-grained control over inbound and outbound traffic to the EC2 instances and RDS.
