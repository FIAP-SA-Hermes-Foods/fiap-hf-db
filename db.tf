data "aws_db_instance" "check_instance" {
  db_instance_identifier = "{{NAME_DB}}"
}

locals {
  instance_exists = length(data.aws_db_instance.check_instance) > 0
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "create_instance" {
  count = local.instance_exists ? 1 : 0 #? verifica se existe a instancia desejada

  identifier            = "{{NAME_DB}}"
  engine                = "postgres"
  engine_version        = "14"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20

  username              = "{{USERNAME_DB}}"
  password              = "{{PASSWORD_DB}}"

  vpc_security_group_ids = [aws_security_group.rds.id]

  license_model         = "general-public-license"
  multi_az              = false
  deletion_protection   = false
  backup_retention_period = 1
}

resource "aws_security_group" "rds" {
  name = "{{NAME_GROUP}}"
  vpc_id = "{{VPC_ID}}"

  ingress {
    from_port = {{DB_FROM_PORT}}
    to_port   = {{DB_TO_PORT}}
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*
output "rds_endpoint" {
  value = aws_db_instance.create_instance.endpoint
}
*/
