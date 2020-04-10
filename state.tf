terraform {
  backend "s3" {
    bucket = "hackathon-fiap-1dvp-333563"
    key    = "state/hackaton-cicd-deploy"
    region = "us-east-1"
  }
}