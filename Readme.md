# AWS Infrastructure Deployment with Terraform

This repository demonstrates Infrastructure as Code (IaC) using Terraform to provision and manage AWS resources. The project includes two separate deployments - a simple EC2 instance and a production-ready EKS (Elastic Kubernetes Service) cluster.
</br>
*All the API keys and secrets used in the repository are inactive, so please don's think of misuing them*

## Repository Structure
```sh
.
├── eks_cluster/           # EKS cluster deployment configuration
│   ├── eks-cluster.tf     # EKS cluster definition
│   ├── main.tf            # Provider configuration and local variables
│   ├── outputs.tf         # Output values after deployment
│   ├── variables.tf       # Variable definitions
│   └── vpc.tf             # VPC network configuration
├── t2_micro/              # Basic EC2 instance deployment
│   └── main.tf            # EC2 instance configuration
└── Readme.md              # Project documentation
```

## Deployment Instructions
### Part 1: Basic AWS EC2 Deployment
> The t2_micro directory contains Terraform configuration that:
- Establishes AWS provider connection to the ap-south-1 region (the nearest region to me)
- Deploys a single EC2 t2.micro instance using an Amazon Linux 2 AMI
- Applies proper resource tagging for identification
  
> Screenshots
![Screenshot from 2025-04-15 02-07-41](https://github.com/user-attachments/assets/75162ffc-507d-49f6-ac94-34835b89ccdd)

### Deploying the EC2 Instance
To deploy the EC2 instance, navigate to the `t2_micro` directory and execute the following commands:
```bash
cd t2_micro
terraform init
terraform plan
terraform apply
terraform destroy
```

### Part 2: EKS Cluster Implementation
>The eks_cluster directory implements a production-ready Kubernetes environment with:
- Custom VPC creation with public and private subnets across multiple availability zones
- NAT gateway configuration for private subnet connectivity
- EKS cluster deployment with public endpoint access
- Two managed node groups with t3.small instances for workload distribution
- Auto-scaling configuration (min: 1, max: 3 nodes)
- Proper Kubernetes tagging for load balancer integration
- configuring simple ingress controller using nginx for the cluster

> Screenshots
![Screenshot from 2025-04-21 14-46-32](https://github.com/user-attachments/assets/db30c65f-6a44-445d-87d8-cd59d754f47b)
![Screenshot from 2025-04-21 14-46-49](https://github.com/user-attachments/assets/099a4cd0-149a-4f26-a667-e1b7e7ab0cdc)
![Screenshot from 2025-04-21 14-48-00](https://github.com/user-attachments/assets/961f36fd-29b6-4142-a751-c4327b0b7b34)
![Screenshot from 2025-04-21 14-48-14](https://github.com/user-attachments/assets/34794c9e-3d48-475b-946c-2306d4ea16b5)

### Deploying the EKS Cluster
To deploy the EKS cluster, navigate to the `eks_cluster` directory and execute the following commands:
```bash
cd eks_cluster
terraform init
terraform plan
terraform apply
```

### Testing the ingress controller
The configuration in `eks_cluster/ingress_controller.tf` deploys the NGINX Ingress Controller on the EKS cluster. The ingress controller acts as a Layer 7 load balancer that routes external HTTP/HTTPS traffic to the appropriate services within the Kubernetes cluster based on defined rules.
> Checking if the ingress controller pods are running:

```sh
kubectl get pods -n ingress-nginx
```
> Finding the external load balancer address
```sh
kubectl get service nginx-ingress-controller -n ingress-nginx
```