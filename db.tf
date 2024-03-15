provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "create_instance" {

  identifier            = "{{NAME_DB}}"
  engine                = "postgres"
  engine_version        = "16.1"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20

  username              = "{{USERNAME_DB}}"
  password              = "{{PASSWORD_DB}}"

  vpc_security_group_ids = [aws_security_group.rds.id]

  license_model         = "postgresql-license"
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
