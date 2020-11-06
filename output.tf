output "public_ip" {
	value = "${aws_instance.access_db-server.public_ip}"
}

output "rds_endpoint" {
	value = "${aws_db_instance.rds_db.endpoint}"
}
