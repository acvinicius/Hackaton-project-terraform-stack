terraform {
  backend "s3" {
    bucket = bucket_workspace
    key    = "${format("state/cicd-deploy-%s", terraform.workspace)}"
    region = "us-east-1"
  }
}