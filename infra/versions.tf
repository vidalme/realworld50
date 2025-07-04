terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "" {
    
  }

  backend "s3" {
    bucket = "eks-terraform-andre"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-west-2" 
 
    # For State Locking
    dynamodb_table = "dev-ekscluster"    
  }  
}

