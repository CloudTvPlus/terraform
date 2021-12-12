terraform {
  required_version = "= 1.0.11"

  backend "s3" {
    bucket         = "init-id-apnortheast2-tfstate"
    key            = "init/terraform/iam/id/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
