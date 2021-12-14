terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    bucket         = "kys-id-apnortheast2-tfstate"
    key            = "kys/terraform/ec2/kys-id/kysd_apnortheast2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
