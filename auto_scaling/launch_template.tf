resource "aws_launch_template" "template" {
	name="Launch-Template"
	image_id="ami-0f9708d1cd2cfee41"
	instance_type="t3.micro"
	key_name="ubuntu"
  vpc_security_group_ids=[aws_security_group.security_gp.id]
	user_data = base64encode(<<-EOF
#!/bin/bash
sudo yum install httpd -y
sudo systemctl enable --now httpd
echo "this is the testing of the file created from terraform" > /var/www/html/index.html
EOF
)
}
