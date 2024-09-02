## GCP `main.yaml` Configuration for 3-Tier Architecture

### Overview
This Google Cloud Platform (GCP) `main.yaml` configuration file sets up a 3-Tier Architecture. The setup includes a Virtual Private Cloud (VPC) network, public and private subnets, firewall rules, a Compute Engine instance for the web server, a Cloud SQL instance for the MySQL database, and a Google Cloud Load Balancer. This architecture is designed for scalability, security, and ease of management.

### Components

1. **VPC Network**
   - **`my-vpc`**: Creates a custom VPC network where all resources are deployed. The VPC is manually configured, and auto creation of subnetworks is disabled.

2. **Subnets**
   - **`public-subnet`**: A public subnet within the VPC that hosts the web server. Resources in this subnet can have direct access to the internet.
   - **`private-subnet`**: A private subnet within the VPC that hosts the Cloud SQL database. Resources in this subnet are not directly accessible from the internet.

3. **Firewall Rules**
   - **`allow-http-ssh`**: Allows incoming HTTP (port 80) and SSH (port 22) traffic to the web server. This firewall rule applies to instances tagged with `web-server`.
   - **`allow-mysql`**: Allows MySQL (port 3306) traffic from the `public-subnet` to the `private-subnet`, enabling communication between the web server and the Cloud SQL instance. This rule applies to instances tagged with `db-server`.

4. **Compute Engine (Web Server)**
   - **`web-server`**: Deploys a Debian-based Virtual Machine (VM) in the `public-subnet`. This VM is configured to automatically install Apache to serve web traffic. The VM is associated with the `web-server` tag to apply the relevant firewall rules.

5. **Cloud SQL (MySQL Database)**
   - **`my-mysql-instance`**: Creates a MySQL database instance within the `private-subnet`. This Cloud SQL instance is accessible only from within the VPC, enhancing security by preventing direct internet access.

6. **Global Load Balancer**
   - **`http-lb`**: A global HTTP load balancer that distributes incoming web traffic across multiple web server instances, ensuring high availability and fault tolerance.
   - **`http-lb-proxy`**: The HTTP proxy component of the load balancer, which handles incoming requests.
   - **`http-lb-url-map`**: Maps incoming requests to the appropriate backend service, which is the web server in this case.
   - **`http-lb-backend`**: The backend service connected to the web server instance. It defines how traffic is forwarded from the load balancer to the web server.
   - **`http-lb-health-check`**: Performs health checks on the web server to ensure that it is available and able to handle traffic. The health check monitors the server by sending HTTP requests to the root path (`/`).

### Usage

To deploy this GCP `main.yaml` configuration:

1. Save the YAML content into a file, such as `main.yaml`.
2. Use the Google Cloud SDK (`gcloud`) to deploy the infrastructure:
   ```bash
   gcloud deployment-manager deployments create my-3-tier-deployment --config main.yaml
3. After the deployment is complete, follow the output instructions to access the web server via the load balancer's IP address.
