output "ENDPOINT_source" {
  value = module.RDS.rds_endpoint
}
# output "USERNAME" {
#   value = module.RDS.rds_username
# }
# output "PASSWORD" {
#   value = var.password
#   sensitive = true
# }
output "PUBLIC_SUBNET_ID" {
  value = module.vpc.PUBLIC_SUBNET_ID
}
output "INSTANCE_SG_ID" {
  value = module.SecurityGroups.INSTANCE_SG_ID
}

output "ENDPOINT_destination" {
  value = module.RDS_copy.rds_destination_endpoint
}
