resource "aws_iam_role"  "ecr_readOnly_role" {
  count = 1
  name = "${format("ecr_readOnly_role_%s_%03d", terraform.workspace, count.index + 1)}"
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
      Name = "${format("ecr_readOnly_role_%s_%03d", terraform.workspace, count.index + 1)}"
  }
}

resource "aws_iam_instance_profile" "ecr_readOnly_profile" {
  count = 1
  name = "${format("ecr_readOnly_profile_%s_%03d", terraform.workspace, count.index + 1)}"
  role = "${aws_iam_role.ecr_readOnly_role.name}"
}

resource "aws_iam_role_policy" "ecr_readOnly_policy" {
  count = 1
  name = "${format("ecr_readOnly_policy_%s_%03d", terraform.workspace, count.index + 1)}"
  role = "${aws_iam_role.ecr_readOnly_role.id}"

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