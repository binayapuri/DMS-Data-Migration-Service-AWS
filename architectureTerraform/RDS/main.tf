# resource "aws_db_parameter_group" "example" {
#   name   = "my-pg"
#   family = "mysql"

#   parameter {
#     name  = "log_connections"
#     value = "1"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_db_instance" "example" {
#   # other attributes
#   parameter_group_name = aws_db_parameter_group.example.name
#   apply_immediately    = true
# }



resource "aws_db_subnet_group" "bp_rds_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.PRIVATE_SUBNET_ID_1, var.PRIVATE_SUBNET_ID_2]
}
resource "aws_db_instance" "bp_rds" {
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

  vpc_security_group_ids = [var.rds_security_group_id]

  tags = {
    "owner"   = "binay"
    "Name"      = "bp_rds"
  }
}
