variable "aws_profile" {
  description = "profile to use from ~/.aws/credentials, usually default"
  default     = "personal"
}

variable "aws_region" {
  description = "default AWS region"
  default     = "us-east-2"
}

terraform {
  required_version = ">= 1.0.5"

  backend "s3" {
    region         = "us-east-2"
    bucket         = "blakes-tf-remote-state-files"
    key            = "eks/eks.tfstate"
    dynamodb_table = "tf-remote-state-files-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.55.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
