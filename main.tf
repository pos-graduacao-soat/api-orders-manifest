provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "rds_orders_user" {
  name = "rds_orders_user"
}

data "aws_ssm_parameter" "rds_orders_password" {
  name           = "rds_orders_password"
  with_decryption = true
}

resource "aws_db_instance" "lanchonete-55-mysql" {
  allocated_storage    = 2
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "orders"
  parameter_group_name = "default.mysql5.7"

  username             = data.aws_ssm_parameter.rds_user.value
  password             = data.aws_ssm_parameter.rds_password.value
}