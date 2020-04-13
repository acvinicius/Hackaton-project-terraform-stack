terraform {
  backend "s3" {
    bucket = "linkteen-333563-prod"
    key    = "state/linkteen-333563-prod"
    region = "us-east-1"
  }
}