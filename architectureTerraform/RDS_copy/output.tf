output "rds_destination_endpoint" {
  value = aws_db_instance.bp_rds_destination.address
}

output "rds_destination_username" {
  value = aws_db_instance.bp_rds_destination.username
}
