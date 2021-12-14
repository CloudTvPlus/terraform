# Atlantis user
variable "atlantis_user" {
  description = "The username that will be triggering atlantis commands. This will be used to name the session when assuming a role. More information - https://github.com/runatlantis/atlantis#assume-role-session-names"
  default     = "atlantis_user"
}

# Account IDs
# Add all account ID to here
variable "account_id" {
  default = {
    id = "084180625896"
    # 20211213 kys-id 변경 시작
    # prod = "636863929368"
    # 20211213 kys-id 변경 끝
  }
}

# Remote State that will be used when creating other resources
# You can add any resource here, if you want to refer from others
variable "remote_state" {
  default = {
    # VPC
    vpc = {
      kysdapne2 = {
        region = "ap-northeast-2"
        bucket = "kys-id-apnortheast2-tfstate"
        key    = "kys/terraform/vpc/kysd_apnortheast2/terraform.tfstate"
      }
      # 20211213 kys-id 변경 시작
      # kyspapne2 = {
      #   region = "ap-northeast-2"
      #   bucket = "art-prod-apnortheast2-tfstate"
      #   key    = "art/terraform/vpc/artp_apnortheast2/terraform.tfstate"
      # }
      # 20211213 kys-id 변경 끝
    }


    # WAF ACL
    waf_web_acl_global = {
      prod = {
        region = ""
        bucket = ""
        key    = ""
      }
    }


    # AWS IAM
    iam = {

      id = {
        region = "ap-northeast-2"
        # 20211213 kys-id 변경 시작
        #bucket = "art-id-apnortheast2-tfstate"
        bucket = "kys-id-apnortheast2-tfstate"
        #key    = "art/terraform/iam/art-id/terraform.tfstate"
        key = "kys/terraform/iam/kys-id/terraform.tfstate"
        # 20211213 kys-id 변경 끝
      }

      # 20211213 kys-id 변경 시작
      #   prod = {
      #     region = "ap-northeast-2"
      #     bucket = "art-id-apnortheast2-tfstate"
      #     key    = "art/terraform/iam/art-prod/terraform.tfstate"
      #   }
      # 20211213 kys-id 변경 끝
    }


    # AWS KMS
    kms = {

      id = {
        apne2 = {
          region = "ap-northeast-2"
          # 20211213 kys-id 변경 시작
          #bucket = "art-id-apnortheast2-tfstate"
          bucket = "kys-id-apnortheast2-tfstate"
          #key = "art/terraform/kms/art-id/id_apnortheast2/terraform.tfstate"
          key = "kys/terraform/kms/kys-id/id_apnortheast2/terraform.tfstate"
          # 20211213 kys-id 변경 끝
        }
      }

      # 20211213 kys-id 변경 시작
      # prod = {
      #   apne2 = {
      #     region = "ap-northeast-2"
      #     bucket = "art-prod-apnortheast2-tfstate"
      #     key    = "art/terraform/kms/art-prod/prod_apnortheast2/terraform.tfstate"
      #   }
      # }
      # 20211213 kys-id 변경 끝

    }
  }
}
