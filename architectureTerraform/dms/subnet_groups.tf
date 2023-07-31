# resource "aws_iam_role" "dms-vpc-role" {
#   name        = "dms-vpc-role"
#   description = "Allows DMS to manage VPC"
#   # assume_role_policy = jsonencode({
#   #   Version = "2012-10-17"
#   #   Statement = [
#   #     {
#   #       Effect = "Allow"
#   #       Principal = {
#   #         Service = "dms.amazonaws.com"
#   #       }
#   #       Action = "sts:AssumeRole"
#   #     },
#   #   ]
#   # })
# }

# resource "aws_iam_role_policy_attachment" "example" {
#   role       = aws_iam_role.dms-vpc-role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole"
# }

# resource "aws_dms_replication_subnet_group" "example" {
#   replication_subnet_group_description = "Example"
#   replication_subnet_group_id          = "example-id"

#   subnet_ids = [
#     "subnet-12345678",
#     "subnet-12345679",
#   ]

#   tags = {
#     Name = "example-id"
#   }

#   # explicit depends_on is needed since this resource doesn't reference the role or policy attachment
#   depends_on = [aws_iam_role_policy_attachment.example]
# }