terraform {
  required_version = "= 1.0.11"

  backend "s3" {
    bucket         = "kys-id-apnortheast2-tfstate"
    key            = "kys/terraform/iam/id/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
