resource "aws_security_group" "security_gp" {
        name="SG"
        vpc_id=data.aws_vpc.vpc.id
# Allow all outbound traffic
egress {
	from_port=0
	to_port=0
	cidr_blocks=["0.0.0.0/0"]
	protocol="-1"
}
# Allow HTTP inbound from anywhere
ingress {
	from_port=80
	to_port=80
	protocol="tcp"
	cidr_blocks=["0.0.0.0/0"]
}
}
