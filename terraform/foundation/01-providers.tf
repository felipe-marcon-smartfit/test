terraform {
  required_providers {
    aws = "~> 5.77"
  }

  backend "s3" {
    profile        = "fmarcon"
    region         = "us-east-2"
    bucket         = "challenge-terraform"
    key            = "foundation/terraform.tfstate"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region

  default_tags {
    tags = {
      Project   = "challenge"
      Managed   = "terraform"
      Owner     = "Grupo 5"
      terraform = "foundation"
    }
  }
}