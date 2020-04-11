resource "aws_s3_bucket" "b" {
  bucket = "linkteen-333563-dev"
  acl    = "private"

  tags = {
    Name        = "linkteen-333563-dev"
    Environment = "admin"
  }
}