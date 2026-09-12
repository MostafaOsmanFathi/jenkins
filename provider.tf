provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
  ec2   = "http://192.168.122.125:4566"
  elbv2 = "http://192.168.122.125:4566"
  s3    = "http://192.168.122.125:4566"
  iam   = "http://192.168.122.125:4566"
  sts   = "http://192.168.122.125:4566"
  cloudwatch = "http://192.168.122.125:4566"
  logs  = "http://192.168.122.125:4566"
  lambda = "http://192.168.122.125:4566"
  }
}

