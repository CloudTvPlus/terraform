terraform {
  required_version = "= 1.0.11" # Terraform Version

  backend "s3" {
    bucket         = "init-id-apnortheast2-tfstate" # Set bucket name
    key            = "init/terraform/iam/id/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock" # Set DynamoDB Table
  }
}
