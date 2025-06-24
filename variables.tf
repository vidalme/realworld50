variable "owner" {
  description = "The owner of the resources for tagging."
  type        = string
}

variable "aws_region" {
  description = "The AWS region where the resources will be deployed."
  type        = string
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)."
  type        = string
}

variable "project_name" {
  description = "The name of the project for resource tagging."
  type        = string
}

