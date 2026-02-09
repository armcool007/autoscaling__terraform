resource aws_lb_target_group "tggrp" {
	name="testting-TG"
	port     = 80
	protocol = "HTTP"
	vpc_id   = data.aws_vpc.fetch.id
}
