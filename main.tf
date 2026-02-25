# --- Terraform Configuration ---
# Enforces best practices and version constraints required by TFLint
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# --- Provider Configuration ---
provider "aws" {
  region = "us-east-1"
}

# --- EC2 Instance Resource ---
# This configuration passes TFLint, Checkov, and Trivy security scans
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI for your region
  instance_type = "t2.micro"

  # Checkov Suppression: t2.micro does not support EBS optimization
  # checkov:skip=CKV_AWS_135: t2.micro instance type does not support EBS optimization
  ebs_optimized = false

  # Security: Enforce IMDSv2 (Required by Trivy/Checkov CKV_AWS_79)
  metadata_options {
    http_tokens = "required"
  }

  # Security: Enable root block device encryption (Required by Trivy/Checkov CKV_AWS_8)
  root_block_device {
    encrypted = true
  }

  # Security: Enable detailed monitoring (Required by Checkov CKV_AWS_126)
  monitoring = true

  # Compliance: Mandatory tags as defined in User Story AWS-44
  tags = {
    Name        = "Secure_Instance"
    Environment = "Dev"
    Owner       = "Melissa"
  }
}
