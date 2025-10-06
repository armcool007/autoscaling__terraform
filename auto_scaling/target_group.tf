resource "aws_lb_target_group" "targetgroup" {
	name="TG"
	target_type="instance"
	protocol="HTTP"
	port=80
	vpc_id=data.aws_vpc.vpc.id

health_check {
	protocol="HTTP"
	path="/"
	healthy_threshold=5
	unhealthy_threshold=2
	interval=300
	matcher="200"
}
}

