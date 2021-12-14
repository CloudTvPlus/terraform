terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    # 20211213 코드 수정 시작
    #bucket         = "art-id-apnortheast2-tfstate"
    #key            = "art/terraform/codebuild/artd_apnortheast2/terraform.tfstate"
    bucket = "kys-id-apnortheast2-tfstate"
    key    = "kys/terraform/codebuild/kysd_apnortheast2/terraform.tfstate"
    # 20211213 코드 수정 끝
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

