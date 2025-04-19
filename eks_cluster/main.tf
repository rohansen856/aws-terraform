provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
  access_key="AKIAWFTUHDAD22B5TJJP"
  secret_key="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"
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}