resource "aws_iam_role" "replication_role" {
  name = "rds-replication-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole"]


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Version" : "2012-10-17",
        "Statement" : [
          {
            "Effect" : "Allow",
            "Action" : "dms:*",
            "Resource" : "*"
          },
          {
            "Effect" : "Allow",
            "Action" : [
              "kms:ListAliases",
              "kms:DescribeKey"
            ],
            "Resource" : "*"
          },
          {
            "Effect" : "Allow",
            "Action" : [
              "iam:GetRole",
              "iam:PassRole",
              "iam:CreateRole",
              "iam:AttachRolePolicy"
            ],
            "Resource" : "*"
          },
          {
            "Effect" : "Allow",
            "Action" : [
              "ec2:DescribeVpcs",
              "ec2:DescribeInternetGateways",
              "ec2:DescribeAvailabilityZones",
              "ec2:DescribeSubnets",
              "ec2:DescribeSecurityGroups",
              "ec2:ModifyNetworkInterfaceAttribute",
              "ec2:CreateNetworkInterface",
              "ec2:DeleteNetworkInterface"
            ],
            "Resource" : "*"
          },
          {
            "Effect" : "Allow",
            "Action" : [
              "cloudwatch:Get*",
              "cloudwatch:List*"
            ],
            "Resource" : "*"
          },
          {
            "Effect" : "Allow",
            "Action" : [
              "logs:DescribeLogGroups",
              "logs:DescribeLogStreams",
              "logs:FilterLogEvents",
              "logs:GetLogEvents"
            ],
            "Resource" : "*"
          }
        ]
      }

    ]
  })
}

output "replication_role_arn" {
  value = aws_iam_role.replication_role.arn
}
