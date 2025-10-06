resource "aws_autoscaling_group" "auto_scale" {
	name="AUTO-scaling"
  launch_template {
  id = aws_launch_template.template.id
}
	vpc_zone_identifier=data.aws_subnets.subnet.ids
	target_group_arns=[aws_lb_target_group.targetgroup.arn]
	min_size=2
	max_size=5
	desired_capacity=2
	health_check_type="ELB"
	health_check_grace_period=300
	tag {
		key="Name"
		value="ec2-amazon-linux"
		propagate_at_launch=true
	}
}
