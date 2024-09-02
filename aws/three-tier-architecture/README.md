## 3-Tier Architecture Description

### Overview
The **3-Tier Architecture** is a common and widely used design pattern in cloud environments, particularly on AWS. It separates an application into three logical layers: the Presentation layer (frontend), the Application layer (backend), and the Data layer (database). This architecture enhances scalability, manageability, and security by isolating different components.

### Components

1. **Virtual Private Cloud (VPC)**
   - The VPC acts as a logically isolated network in the cloud where all resources in the architecture reside. It provides networking functionalities such as IP addressing, routing, and security.

2. **Public Subnet**
   - The Public Subnet is a section of the VPC that contains resources accessible from the internet. In this architecture:
     - An **EC2 instance** labeled **Web Server** is deployed in the Public Subnet.
     - The **Web Server** hosts the application frontend and handles incoming HTTP requests.
     - A **Security Group** is attached to the Web Server, allowing inbound traffic on port 80 (HTTP) and port 22 (SSH).

3. **Private Subnet**
   - The Private Subnet is another section of the VPC that is not directly accessible from the internet. It is used to host sensitive resources:
     - An **RDS MySQL Database** instance is deployed in the Private Subnet.
     - The database stores application data and is secured by a **Security Group** that only allows traffic on port 3306 (MySQL) from the Web Server's Security Group.

4. **Internet Gateway**
   - The Internet Gateway is attached to the VPC to enable internet communication. It allows instances in the Public Subnet to receive and send traffic to the internet.

5. **Application Load Balancer (ALB)**
   - The ALB distributes incoming traffic across multiple EC2 instances (Web Servers) to ensure high availability and fault tolerance.
   - It is placed in front of the Web Server in the Public Subnet and handles all incoming HTTP traffic.

### Traffic Flow

1. **Inbound Traffic:**
   - **Internet Gateway** allows external users to access the Web Server through the **ALB**.
   - The ALB routes HTTP requests to the Web Server, which processes the requests and interacts with the database if necessary.

2. **Internal Traffic:**
   - The Web Server communicates with the **RDS MySQL Database** in the Private Subnet to fetch or store data.

3. **Outbound Traffic:**
   - The Web Server can initiate outbound requests to the internet if required (e.g., for updates) through the Internet Gateway.

### Security

- **Security Groups** provide fine-grained access control at the instance level, ensuring that only allowed traffic can reach the Web Server and Database.
- The architecture isolates the database in a **Private Subnet**, enhancing security by preventing direct internet access.

### Benefits

- **Scalability**: The architecture supports horizontal scaling by adding more instances to the ALB.
- **Manageability**: Isolating components into different layers simplifies management and troubleshooting.
- **Security**: By separating public and private resources, the architecture improves the overall security posture of the application.
