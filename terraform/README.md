# Terraform Module: AWS Aurora RDS Cluster
This Terraform module is designed to create an AWS Postgres Aurora DB Cluster with 2 DB instances, one for writing (primary instance) and the other for reading (read replica), and the necessary security group rules to allow access to the DB cluster.


## Prerequisites
1. AWS account with IAM user with permissions for EC2, RDS and IAM. Create an access key for the IAM user
2. A VPC where the DB Cluster will be deployed
3. Terraform 1.0.0+, with a 3.48.0+ aws provider set-up

## Module Input
- vpc_id: The ID of the VPC the DB Cluster will be deployed into
- subnet_ids: Subnet IDs in which the database instances should be created in
- security_groups: A list of security group

## Module Output
- security_group_id (string): The ID of the security group attached to the RDS Cluster.
- endpoint (string): The DNS address of the DB cluster.
- reader_endpoint (string): The DNS address of the read replica.

## Usage
`cd` into production directory
Log in to AWS account
`Terraform init`
`Terraform apply`