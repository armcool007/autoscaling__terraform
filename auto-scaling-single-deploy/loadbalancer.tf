resource aws_lb "lbs" {
	name="testing-LB"
	internal           = false
	load_balancer_type = "application"
	security_groups    = [data.aws_security_group.sg.id]
	subnets            = data.aws_subnets.allsubs.ids
	tags = {
	    Environment = "production"
	  }
}
