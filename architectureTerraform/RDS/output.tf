output "rds_endpoint" {
  value = aws_db_instance.bp_rds.address
}

output "rds_username" {
  value = aws_db_instance.bp_rds.username
}
