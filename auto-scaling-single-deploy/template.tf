resource aws_launch_template "lt" {
	image_id=var.amiid
	instance_type=var.type
	key_name=var.pemfile
	vpc_security_group_ids=[data.aws_security_group.sg.id]
	tags={Name="testing-machine"}
	user_data = base64encode (<<EOF
	#!/bin/bash
	sudo yum install httpd -y
	sudo systemctl enable --now httpd
	sudo echo "hello" >> /var/www/html/index.html
	EOF
	)
}
