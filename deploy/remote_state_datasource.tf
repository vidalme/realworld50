# data "terraform_remote_state" "eks" {
#   backend = "local"

#   config = {
#     path = "../infra/terraform.tfstate"
#   }
# }
data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "terrafeks-terraform-andre"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-west-2" 
  }
}

