resource "aws_dms_endpoint" "source_endpoint" {
  endpoint_id               = "source"
  endpoint_type             = "source"
  engine_name               = "mysql"  
  username                  = "Source" 
  password                  = "password" 
  server_name               = var.rds_endpoint
  port                      = 3306 
  ssl_mode                    = "none"
}

resource "aws_dms_endpoint" "destination_endpoint" {
  endpoint_id               = "destination"
  endpoint_type             = "target"
  engine_name               = "mysql" 
  username                  = "Destination"  
  password                  = "password" 
  server_name               = var.rds_destination_endpoint
  port                      = 3306 
  ssl_mode                    = "none"
}
