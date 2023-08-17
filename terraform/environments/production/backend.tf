terraform {
  backend "s3" {
    bucket         = "auroras3"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
  }
}