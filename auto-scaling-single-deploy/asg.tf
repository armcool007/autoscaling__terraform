resource aws_autoscaling_group "asg" {
  name                      = "autoscaling-test"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  vpc_zone_identifier       = data.aws_subnets.allsubs.ids
  target_group_arns	    = [aws_lb_target_group.tggrp.arn] 
   launch_template {
    id      = aws_launch_template.lt.id
  }
	tag {
                key="Name"
                value="ec2-amazon-linux"
                propagate_at_launch=true
        }

	
}

#utomatic scaling (CPU-based)
resource "aws_autoscaling_policy" "cpu_target_tracking" {
  name                = "cpu-target-tracking-policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type         = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value       = 10.0  # Average CPU 60% rakhne ki koshish
#    disable_scale_in   = false
  }
}
