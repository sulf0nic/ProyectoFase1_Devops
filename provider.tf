terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0"
  
provider "aws" {
  region = "us-east-2c"  
  access_key = "AKIAYHWOGBKMVK6OD6EW"
}
  
}