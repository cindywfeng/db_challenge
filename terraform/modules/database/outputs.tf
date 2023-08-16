output "security_group_id" {
  value = aws_rds_cluster.db_cluster.vpc_security_group_ids
}

output "endpoint" {
  value = aws_rds_cluster.db_cluster.endpoint
}

output "reader_endpoint" {
  value = aws_rds_cluster.db_cluster.reader_endpoint
}