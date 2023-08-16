output "security_group_id" {
  value = module.database.security_group_id
}

output "endpoint" {
  value = module.database.endpoint
}

output "reader_endpoint" {
  value = module.database.reader_endpoint
}