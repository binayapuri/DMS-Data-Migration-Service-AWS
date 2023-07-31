variable "region" {
  description = "AWS region where resources will be created."
}

variable "db_instance_identifier" {
  description = "RDS MySQL instance identifier."
}

variable "replica_db_instance_class" {
  description = "RDS MySQL replica instance class."
}

variable "replica_count" {
  description = "Number of read replicas."
}

variable "rds_destination_endpoint" {
  
}

variable "rds_endpoint" {
  
}
variable "INSTANCE_SG_ID" {
  
}

variable "rds_security_group_id" {
  
}

variable "rds_security_group_id_destination" {
  
}


variable "PRIVATE_SUBNET_ID_1" {
  
}
variable "PRIVATE_SUBNET_ID_2" {
  
}


variable "PRIVATE_SUBNET_DESTINATION_2" {
  
}

variable "PRIVATE_SUBNET_DESTINATION_1" {
  
}
