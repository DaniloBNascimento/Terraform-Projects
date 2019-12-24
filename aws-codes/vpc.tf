provider "aws" {
    version = "~> 2.0"
    region                  = "sa-east-1"
    shared_credentials_file = "/home/.aws/credentials"
    profile                 = "awsterraform"
} 


resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "trainee-terraform"
  }
}