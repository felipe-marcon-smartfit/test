terraform {
  required_providers {
    aws = "~> 5.77"
  }
}

provider "aws" {
	profile = "fmarcon"
	region  = "us-east-2"
}