# VPC
#
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version    = "~> 1.30"
}

resource "aws_security_group" "RDSdbs1" {
  name        = "RDSdbs1"
  description = "RDS database servers (terraform-managed)"
  vpc_id      = "${var.rds_vpc_id}"

  # Only postgres in
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "RDSpgdb1" {
  allocated_storage         = 5 
  backup_retention_period   = 0 
  db_subnet_group_name      = "${var.rds_public_subnet_group}"
  instance_class            = "db.t2.small"
  password                  = "Password1"
  username                  = "User"
  final_snapshot_identifier = "DEMODB2"
  multi_az                  = false
  publicly_accessible       = true

  vpc_security_group_ids   = ["${aws_security_group.RDSdbs1.id}"]

  engine                   = "postgres"
  engine_version           = "9.5.4"
  identifier               = "pgdb1"
  name                     = "pgdb1"
#  storage_type             = "gp2"

#  password                 = "${trimspace(file("${path.module}/secrets/mydb1-password.txt"))}"
  port                     = 5432
# storage_encrypted        = true # you should always do this

}
