
resource "aws_dms_replication_task" "dms_task" {
  migration_type            = "full-load"
  replication_instance_arn  = aws_dms_replication_instance.dms-instance.replication_instance_arn
  replication_task_id       = "test-dms-replication-task-tf-bp"
  source_endpoint_arn = aws_dms_endpoint.source_endpoint.endpoint_arn
  table_mappings            = "{\"rules\":[{\"rule-type\":\"selection\",\"rule-id\":\"1\",\"rule-name\":\"1\",\"object-locator\":{\"schema-name\":\"%\",\"table-name\":\"%\"},\"rule-action\":\"include\"}]}"

  tags = {
    Name = "test"
  }

  target_endpoint_arn = aws_dms_endpoint.destination_endpoint.endpoint_arn
}