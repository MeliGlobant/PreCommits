config {
  call_module_type = "all"
}

plugin "aws" {
  enabled = true
  version = "0.28.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "aws_resource_missing_tags" {
  enabled = true
  tags = [
    "project",
    "environment",
    "managedBy",
    "owner",
    "application",
    "version"
  ]
}
