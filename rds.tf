resource "aws_db_subnet_group" "db_subnet" {
	name = "mysql-subnet"
	subnet_ids = ["${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
}

resource "aws_db_parameter_group" "para_9th" {
	name = "mysql-para"
	family = "mysql5.6"
}

resource "aws_db_instance" "rds_db" {
	allocated_storage = 20
	storage_type = "gp2"
	engine = "mysql"
	engine_version = "5.6"
	instance_class = "db.t2.micro"
	identifier = "test-db"
	name = "mydb0987654321"
	username = "mrawat"
	password = "${var.PASSWORD}"
	db_subnet_group_name = "${aws_db_subnet_group.db_subnet.name}"
	parameter_group_name = "${aws_db_parameter_group.para_9th.name}"
	multi_az = "false"
	vpc_security_group_ids = [aws_security_group.db_allow_sec.id]
	backup_retention_period = 30
	availability_zone = "${var.availability_zone_names[2]}"
	skip_final_snapshot = "true"
}


