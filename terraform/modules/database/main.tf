resource "aws_rds_cluster" "db_cluster" {
  cluster_identifier      = "${var.environment}-${var.region}-db-cluster"
  engine                  = var.engine
  availability_zones      = var.availability_zones
  database_name           = var.database_name
  master_username         = local.db-credentials.master_username
  master_password         = local.db-credentials.master_password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  vpc_security_group_ids  = var.vpc_security_group_ids
  skip_final_snapshot     = var.skip_final_snapshot
  storage_encrypted       = var.storage_encrypted
  db_subnet_group_name    = aws_db_subnet_group.db_subnet.name

}

resource "aws_db_subnet_group" "db_subnet" {
  name       = var.subnet_group_name
  subnet_ids = ["subnet-0071d4131c99abd26", "subnet-00bf1a425963bdd2c", "subnet-08a7a6fb6124d4373"]
}

  # Create the first instance (index 0) as the primary instance (writer)
resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.instance_count
  identifier         = count.index == 0 ? "${var.environment}-${var.region}-db-instance-writer" : "${var.environment}-${var.region}-db-instance-reader-${count.index}"
  cluster_identifier = aws_rds_cluster.db_cluster.id
  instance_class     = count.index == 0 ? var.reader_instance_class : var.writer_instance_class
  engine             = aws_rds_cluster.db_cluster.engine
  depends_on         = [aws_rds_cluster.db_cluster]
}


data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "db-credentials"
}

locals {
  db-credentials = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}