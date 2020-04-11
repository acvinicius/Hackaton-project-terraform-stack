terraform {
  backend "s3" {
    bucket = "hackathon-linkteen-333563"
    key    = "state/hackaton-cicd-deploy"
    region = "us-east-1"
  }
}