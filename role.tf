resource "aws_iam_role"  "ecr_readOnly_role" {
  name = "${format("ecr_readOnly_role_%s", terraform.workspace)}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      Name = "${format("ecr_readOnly_role_%s", terraform.workspace)}"
  }
}

resource "aws_iam_instance_profile" "ecr_readOnly_profile" {
  name = "${format("ecr_readOnly_profile_%s", terraform.workspace)}"
  role = "${format("aws_iam_role.ecr_readOnly_role_%s.name", terraform.workspace)}"
}

resource "aws_iam_role_policy" "ecr_readOnly_policy" {
  name = "${format("ecr_readOnly_policy_%s", terraform.workspace)}"
  role = "${format("aws_iam_role.ecr_readOnly_role_%s.id", terraform.workspace)}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:DescribeImages",
                "ecr:BatchGetImage",
                "ecr:GetLifecyclePolicy",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:ListTagsForResource",
                "ecr:DescribeImageScanFindings"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}