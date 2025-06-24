# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "6.0.0-beta3"
#     }
#   }
# }

# provider "aws" {
#   # Configuration options
#   region = var.region

#   skip_credentials_validation = true
#   skip_metadata_api_check   = true
#   skip_requesting_account_id = true

#   endpoints {
#     ec2 = "http://localhost:4566"
#     s3  = "http://localhost:4566"
#   }
# }