# AWS Infrastructure as Code Project
This repository demonstrates Infrastructure as Code (IaC) using Terraform to provision and manage AWS resources. The project includes two separate deployments - a simple EC2 instance and a production-ready EKS (Elastic Kubernetes Service) cluster.

## Repository Structure
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

## Deployment Instructions

### Deploying the EC2 Instance
To deploy the EC2 instance, navigate to the `t2_micro` directory and execute the following commands:
```bash
cd t2_micro
terraform init
terraform plan
terraform apply
terraform destroy
```

### Deploying the EKS Cluster
To deploy the EKS cluster, navigate to the `eks_cluster` directory and execute the following commands:
```bash
cd eks_cluster
terraform init
terraform plan
terraform apply
```

