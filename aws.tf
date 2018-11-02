variable "region" {default = "us-east-2"}
variable "aws_instance_type" {
    default = "t2.micro"
}
variable "amis" {
  type = "map"
   default = {
    "us-east-1" = "ami-b374d5a5"
	"us-east-2" = "ami-5e8bb23b"
    "us-west-2" = "ami-4b32be2b"
  } 
}
variable "rds_vpc_id" {
  default = "vpc-5ac39b32"
  description = "Our default RDS virtual private cloud (rds_vpc)."
}

variable "rds_public_subnets" {
  default = "subnet-92e3acfa,subnet-a4be3ade,subnet-a806e9e4"
  description = "The public subnets of our RDS VPC rds-vpc."
}

variable "rds_public_subnet_group" {
  default = "default"
  description = "Apparently the group name, according to the RDS launch wizard."
}