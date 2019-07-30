resource "aws_s3_bucket" "sam-app" {
  provider = "aws.london"
  bucket   = "sam-app-${terraform.workspace}"
  acl      = "private"
}
