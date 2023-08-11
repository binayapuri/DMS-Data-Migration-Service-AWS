resource "aws_db_subnet_group" "bp_rds_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.PRIVATE_SUBNET_DESTINATION_2, var.PRIVATE_SUBNET_DESTINATION_1]
}
resource "aws_db_instance" "bp_rds_destination" {
  engine               = var.engine
  identifier           = var.identifier
  allocated_storage    = var.allocated_storage
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.bp_rds_subnet_group.name
  skip_final_snapshot  = true
  publicly_accessible  = false
  parameter_group_name = "replication"
  backup_retention_period = 4

  vpc_security_group_ids = [var.rds_security_group_id_destination]

  tags = {
    "owner"   = "binay"
    "Name"      = "bp_rds_destination"  
  }
}
