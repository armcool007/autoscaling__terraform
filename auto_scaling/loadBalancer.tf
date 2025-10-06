resource "aws_lb" "load_balancer" {
	name="ALB"
	load_balancer_type="application"
	internal=false
  #vpc_id=data.aws_vpc.vpc.id
	subnets=data.aws_subnets.subnet.ids
	security_groups=[aws_security_group.security_gp.id]
}
