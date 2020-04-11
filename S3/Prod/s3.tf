resource "aws_s3_bucket" "b" {
  bucket = "linkteen-333563-prod"
  acl    = "private"

  tags = {
    Name        = "linkteen-333563-prod"
    Environment = "admin"
  }
}