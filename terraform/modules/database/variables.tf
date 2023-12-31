variable "engine" {
  type        = string
  description = "(Required) Name of the database engine to be used for this DB cluster. Valid Values: aurora-mysql, aurora-postgresql, mysql, postgres. (Note that mysql and postgres are Multi-AZ RDS clusters)."
  default     = "aurora-postgresql"
}


variable "database_name" {
  type        = string
  description = "The name for the database in the RDS cluster."
  default     = "auroradb"
}

variable "backup_retention_period" {
  type        = number
  description = "The number of days to retain automated backups."
  default     = 5
}

variable "preferred_backup_window" {
  type        = string
  description = "The daily time range during which the backups happen"
  default     = "07:00-09:00"
}

variable "instance_count" {
  type        = number
  description = "The number of instances to create"
  default     = 2
}

variable "reader_instance_class" {
  type        = string
  description = "Instance class for the reader instance"
  default     = "db.t3.medium"
}


variable "writer_instance_class" {
  type        = string
  description = "Instance class for the writer instances"
  default     = "db.t3.medium"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security groups to associate with the Cluster"
  default     = ["sg-0b82ce66077181e3b"]
}

variable "db_subnet_group_name" {
  type        = string
  description = "DB subnet group to associate with this DB instance."
  default     = "db-subnet-group"
}

variable "subnet_group_name" {
  type        = string
  description = "DB subnet group name to associate with this DB instance."
  default     = "db-subnet-group"
}

variable "environment" {
  type        = string
  description = "Cluster environment e.g. sandbox, development, staging, production"
  default     = "production"
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of Availability zones of the instance"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "region" {
  type        = string
  description = "The name of the AWS region"
  default     = "eu-west-2"
}

variable "skip_final_snapshot" {
  type        = string
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
  default     = "true"
}

variable "storage_encrypted" {
  type        = string
  description = "Specifies whether the DB cluster is encrypted."
  default     = "true"
}

# variable "deletion_protection" {
#   type        = string
#   description = "If the DB instance should have deletion protection enabled."
#   default     = "true"
# }


