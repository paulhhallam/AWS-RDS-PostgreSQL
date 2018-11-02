# AWS-RDS-PostgreSQL

AWS-RDS-PostgreSQL



VPC tutorial etc


https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateVPC.html

The terraform commands to run the scripts are:


	terraform init -var-file="<location and name of your secrets file>.auto.tfvars"

	terraform apply -var-file="<location and name of your secrets file>.auto.tfvars"

	terraform delete -var-file="<location and name of your secrets file>.auto.tfvars"



where <location and name of your secrets file>.auto.tfvars is similar to the following:


	#MySecretKeys.auto.tfvars

	access_key = "<your AWS access key"

	secret_key = "<your AWS secret key>"



Use pgAdmin on your PC to create a connection to the AWS instance.

Connection Details:

	Host = AWS Endpoint, e.g. pgdb1.cff.....us-east-2.rds.amazonaws.com

	Port=5432

	Maintenance Database = pgdb1

	Username = DBUser

	Password = Password1

	