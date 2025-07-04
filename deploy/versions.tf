terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }
  }
  backend "s3" {
    bucket = "eks-terraform-andre"
    key    = "dev/app1k8s/terraform.tfstate"
    region = "us-west-2" 
 
    # For State Locking
    dynamodb_table = "dev-app1k8s"    
  }    
}
