
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.20.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key # read from env
  secret_key = var.secret_key # read from env
}
