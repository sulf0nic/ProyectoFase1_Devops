terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
      region = "us-east-2c"  
    }
  }
  required_version = ">= 1.0"
  
}