resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${file(var.PUBLIC_KEY)}"
}


resource "aws_instance" "access_db-server" {
# count                  = "${var.COUNT}"
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.mykey.key_name}"
  subnet_id              = "${aws_subnet.subnet_public.id}"
  vpc_security_group_ids = [aws_security_group.allow_sec.id]
  tags = {
    	count = "${var.COUNT}"
    	#Name  = "Db_Terra_Instance_${count.index}"
    	Name = "Access_DB"
  }
}
