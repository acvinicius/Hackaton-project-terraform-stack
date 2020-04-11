resource "aws_s3_bucket" "b" {
  bucket = "linkteen-333563-homol"
  acl    = "private"

  tags = {
    Name        = "linkteen-333563-homol"
    Environment = "admin"
  }
}