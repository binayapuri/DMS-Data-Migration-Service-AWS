resource "aws_dms_replication_subnet_group" "dms_subnet_group" {
  replication_subnet_group_description = "Test replication subnet group"
  replication_subnet_group_id          = "test-dms-replication-subnet-group-tf"
  subnet_ids                         = [
    var.PRIVATE_SUBNET_DESTINATION_2,
    var.PRIVATE_SUBNET_ID_1,
    var.PRIVATE_SUBNET_ID_2,
    var.PRIVATE_SUBNET_DESTINATION_1
    ]
}

#done
resource "aws_dms_replication_instance" "dms-instance" {
  allocated_storage          = 10
  apply_immediately          = true
  auto_minor_version_upgrade = false
  multi_az                   = false
  publicly_accessible        = true
  replication_instance_class = "dms.t2.micro"
  replication_instance_id    = "dms-instance"

  tags = {
    Name = "DMS-Replication-Instance"
  }

  vpc_security_group_ids = [
    # var.INSTANCE_SG_ID,
    # var.rds_security_group_id_destination,
    # var.rds_security_group_id,
  ]
  depends_on = [aws_iam_role.dms-vpc-role]
}



