resource "aws_db_subnet_group" "db_subnet" {
  name       = var.subnet_group_name
  subnet_ids = ["subnet-0071d4131c99abd26", "subnet-00bf1a425963bdd2c", "subnet-08a7a6fb6124d4373"]
}
